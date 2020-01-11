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
    @figure = Figure.create(name: params["figure"]["name"])
    if params["title"]["name"] != ""
      @title = Title.create(name: params["title"]["name"])
      @figure.title_ids << @title.id
    else
      @figure.title_ids << params["figure"]["title_ids"])
    end
    if params["landmark"]["name"] != ""
      @landmark = Landmark.create(name:params["landmark"]["name"])
      @figure.landmark_ids << @landmark.id
    else 
      @figure.landmark_ids << params["figure"]["landmark_ids"])
      
      @figure = Figure.create(name: params["figure"]["name"], title_ids: params["figure"]["title_ids"])
    end
    #params["figure"]["title_ids"].each do |item|
      #if !Title.find(item)
        #Title.create
    
    
    
    #if !Title.find()
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
  
  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end
  
  get 'figures/:id/edit' do 
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
