require './spec/spec_helper'
require './app'

describe 'SinatraApiSample', type: :routing do
  def app
    SinatraApiSample
  end

  describe 'GET users' do
    context 'no users' do
      it 'returns no users' do
        get '/users'
        expect(last_response.body).to include ''
      end
    end

    context 'several users' do
      it 'returns all the users' do
        user1 = FactoryGirl.create :user
        user2 = FactoryGirl.create :user2
        users = [user1, user2]

        get '/users'
        expect(last_response.body).to eq users.to_json
      end
    end
  end

  describe 'GET user' do
    it 'returns specific user' do
      user = FactoryGirl.create :user
      get '/users/harry'
      expect(last_response.body).to eq user.to_json
    end
  end

  describe 'POST users' do
    it 'adds a new user' do
      params = { username: 'harry', email: 'harry@mail.com', name: 'Harry Potter' }
      post '/users', params.to_json, { :CONTENT_TYPE => 'application/json', :ACCEPT => 'application/json' }
      expect(last_response.body).to eq params.to_json
    end
  end

  describe 'PUT user' do
    it 'modifies a specific user' do
      FactoryGirl.create :user
      params = { username: 'harry', email: 'harry@mail.com', name: 'Harry' }
      put 'users/harry', params.to_json, { :CONTENT_TYPE => 'application/json', :ACCEPT => 'application/json' }
      expect(last_response.body).to eq params.to_json
    end
  end

  describe 'DELETE user' do
    it 'deletes a specific user' do
      FactoryGirl.create :user
      response = { message: 'harry successfully deleted.' }
      delete 'users/harry'
      expect(last_response.body).to eq response.to_json
    end
  end
end
