class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"application/index"
  end
  
  get '/figures' do 
    erb :"figures/index"
  end
  
  get '/landmarks' do
    erb :"landmarks/index"
  end
end
