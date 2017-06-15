FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y libpq-dev
RUN apt-get install -y postgresql
RUN apt-get install -y git

RUN apt-get install -y ruby
RUN apt-get install -y gem
RUN apt-get install -y ruby-dev
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y pkg-config
RUN apt-get install -y make
RUN apt-get install -y clang

WORKDIR '/root'
RUN git clone https://github.com/salsanads/sinatra-api-sample.git
WORKDIR '/root/sinatra-api-sample'

# Installing additional libraries
RUN gem install bundler
RUN bundle install

# Creating database
USER postgres
WORKDIR '/opt'
RUN sed -i '/local   all             all                                     peer/c\local   all             all                                     trust' /etc/postgresql/9.5/main/pg_hba.conf &&\
  sed -i '/host    all             all             127.0.0.1\/32            md5/c\host    all             all             127.0.0.1\/32            trust' /etc/postgresql/9.5/main/pg_hba.conf &&\
  sed -i '/host    all             all             ::1\/128                 md5/c\host    all             all             ::1\/128                 trust' /etc/postgresql/9.5/main/pg_hba.conf
RUN /etc/init.d/postgresql start &&\
  psql --command "update pg_database set datallowconn = TRUE where datname = 'template0';" &&\
  psql -d template0 --command "update pg_database set datistemplate = FALSE where datname = 'template1';" &&\
  psql -d template0 --command "drop database template1;" &&\
  psql -d template0 --command "create database template1 with template = template0 encoding = 'UTF8';" &&\
  psql -d template0 --command "update pg_database set datistemplate = TRUE where datname = 'template1';" &&\
  psql -d template1 --command "update pg_database set datallowconn = FALSE where datname = 'template0';" &&\
  /etc/init.d/postgresql stop

USER root
WORKDIR '/root/sinatra-api-sample'
RUN cp sample.env .env
RUN /etc/init.d/postgresql restart &&\
  sleep 10 &&\
  rake db:create > /dev/null &&\
  rake db:migrate > /dev/null &&\
  rake db:seed > /dev/null

CMD service postgresql restart && sleep 40 && shotgun --host 0.0.0.0
