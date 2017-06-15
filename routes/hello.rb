require 'another_hola'

class SinatraApiSample < Sinatra::Base
  get '/hellos' do
    AnotherHola.hi('english')
  end

  get '/hellos/:language' do
    AnotherHola.hi(params[:language])
  end
end
