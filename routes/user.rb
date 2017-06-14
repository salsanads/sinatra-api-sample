class SinatraApiSample < Sinatra::Base
  get '/users' do
    User.all.to_json
  end

  get '/users/:username' do
    User.where(username: params[:username]).first.to_json
  end

  post '/users' do
    new_user = JSON.parse(request.body.read)
    user = User.new(new_user)
    if user.save
      user.to_json
    else
      halt 422, user.errors.full_messages.to_json
    end
  end

  put '/users/:username' do
    user = User.where(username: params[:username]).first
    if user
      update_user = JSON.parse(request.body.read)
      if user.update_attributes(update_user)
        user.to_json
      else
        halt 422, user.errors.full_messages.to_json
      end
    else
      response = {}
      response[:message] = 'No user found.'
      response.to_json
    end
  end

  delete '/users/:username' do
    user = User.where(username: params[:username]).first
    response = {}
    if user
      user.destroy
      response[:message] = params['username'] + ' successfully deleted.'
    else
      response[:message] = 'No user found.'
    end
    response.to_json
  end
end
