require 'dotenv/load'
require 'sinatra'
require 'json'

require './config/environment'
require './models/init'
require './routes/init'

class SinatraApiSample < Sinatra::Base
  before do
    content_type :json
  end

  configure :production do
    set :raise_errors, false
    set :show_exceptions, false
  end
end
