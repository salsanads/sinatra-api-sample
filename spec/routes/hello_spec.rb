require './spec/spec_helper'
require './app'

describe 'SinatraApiSample', type: :routing do
  def app
    SinatraApiSample
  end

  describe 'GET hellos' do
    it 'returns default language' do
      get '/hellos'
      expect(last_response.body).to include 'hello world'
    end

    it 'returns spanish' do
      get '/hellos/spanish'
      expect(last_response.body).to include 'hola mundo'
    end

    it 'returns english for any language' do
      get '/hellos/ruby'
      expect(last_response.body).to include 'hello world'
    end
  end
end
