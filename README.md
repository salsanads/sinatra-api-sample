# Sinatra API Sample

A simple web API built using Sinatra, PostgreSQL, Rspec, and Factory Girl.

## How to Run
1. Copy `sample.env` to `.env`
```
cp sample.env .env
```

2. Install Bundler
```
gem install bundler
```

3. Install Gems
```
bundle install
```

4. Run Migration
```
rake db:create
rake db:migrate
```

5. Add Seeds (Optional)
```
rake db:seed
```

6. Run `shotgun` on terminal
```
shotgun
```

7. Access it at [http://127.0.0.1:9393/users](http://127.0.0.1:9393/users)

## How to Run inside Docker
1. Build Image
```
docker build . -t salsanads/sinatra-api-sample
```

2. Run Image
```
docker run -d -p 9393:9393 salsanads/sinatra-api-sample
```

3. Wait around 1 minute after running the image, then access it at [http://127.0.0.1:9393/users](http://127.0.0.1:9393/users) on the host

## How to Run Test
1. Install Bundler
```
gem install bundler
```

2. Install Gems
```
bundle install
```

3. Run Rspec
```
bundle exec rspec
```
