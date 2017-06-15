FROM ruby:latest

LABEL maintainer "salsanads@gmail.com"

COPY / /root/sinatra-api-sample/
WORKDIR '/root/sinatra-api-sample'

RUN cp sample.env .env
RUN gem install bundler
RUN bundle install

CMD shotgun --host 0.0.0.0
