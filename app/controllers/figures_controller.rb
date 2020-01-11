class FiguresController < ApplicationController
  
  get '/figures' do 
    @figures = Figure.all
    erb :"figures/index"
  end
  
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end
  
  post '/figures' do
    binding.pry 
    @figure = Figure.create(name: params["figure"]["name"], title_ids: params["figure"]["title_ids"])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do 
    @figure = Figure.all.find(params[:id])
    erb :"figures/show"
  end
end
