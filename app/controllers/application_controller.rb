class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"application/index"
  end
  
  #get '/figures' do 
    #erb :"figures/index"
  #end
  
  #get '/landmarks' do
    #erb :"landmarks/index"
  #end
  
  get '/titles' do 
    erb :"titles/index"
  end
  
  #get '/figures/new' do 
    #erb :"figures/new"
  #end
  
  #post '/figures' do
    #@figure = Figure.new[name: params[name]]
    #redirect to "/figures/#{params[:id]}"
  #end
  
  #get '/figures/:id' do 
    #@figure = Figure.all.find(params[:id])
    #erb :"figures/show"
  #end
end
