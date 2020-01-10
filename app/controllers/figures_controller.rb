class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all
    erb :"figures/index"
  end
  
  get '/figures/new' do
    @landmarks = Landmark.all
    erb :"figures/new"
  end
  
  post '/figures' do
    @figure = Figure.new[name: params["name"]]
    redirect to "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do 
    @figure = Figure.all.find(params[:id])
    erb :"figures/show"
  end
end
