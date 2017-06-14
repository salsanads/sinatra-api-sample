require 'sinatra/activerecord'

configure :development do
  ActiveRecord::Base.establish_connection(
      :adapter  => 'postgresql',
      :host     => ENV['DEVELOPMENT_POSTGRES_HOST'],
      :username => ENV['DEVELOPMENT_POSTGRES_USERNAME'],
      :password => ENV['DEVELOPMENT_POSTGRES_PASSWORD'],
      :database => ENV['DEVELOPMENT_POSTGRES_DATABASE'],
      :encoding => 'utf8'
  )
end

configure :test do
  ActiveRecord::Base.establish_connection(
      :adapter  => 'postgresql',
      :host     => ENV['TEST_POSTGRES_HOST'],
      :username => ENV['TEST_POSTGRES_USERNAME'],
      :password => ENV['TEST_POSTGRES_PASSWORD'],
      :database => ENV['TEST_POSTGRES_DATABASE'],
      :encoding => 'utf8'
  )

  ActiveRecord::Base.logger = nil
end

configure :production do
  ActiveRecord::Base.establish_connection(
      :adapter  => 'postgresql',
      :host     => ENV['PRODUCTION_POSTGRES_HOST'],
      :username => ENV['PRODUCTION_POSTGRES_USERNAME'],
      :password => ENV['PRODUCTION_POSTGRES_PASSWORD'],
      :database => ENV['PRODUCTION_POSTGRES_DATABASE'],
      :encoding => 'utf8'
  )

  ActiveRecord::Base.logger = nil
end
