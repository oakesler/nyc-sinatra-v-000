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
    @figure = Figure.create(name: params["figure"]["name"], title_ids: params["figure"]["title_ids"])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end
  
  get 'figures/id:/edit' do 
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/edit'
    
  end
  
  patch '/figures/:id' do
    if !params[:figure].keys.include?("title_ids")
      params[:owner]["title_ids"] = []
    end
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["title"]["id"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    redirect "figures/#{@figure.id}"
  end
end
