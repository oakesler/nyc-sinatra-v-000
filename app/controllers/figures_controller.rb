class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all
    erb :"figures/index"
  end
  
  get '/figures/new' do
    #binding.pry
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end
  
  post '/figures' do
    #binding.pry
    @figure = Figure.new[name: params["figure"]["name"]]
    redirect to "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do 
    @figure = Figure.all.find(params[:id])
    erb :"figures/show"
  end
end
