class FiguresController < ApplicationController
  get '/figures' do 
    @figures = Figure.all
    erb :"/figures/index"
  end
  
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"/figures/new"
  end
  
  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    @figure.save
    if params["title"]["name"] == ""
      @figure.titles << params["figure"]["title_ids"]
    else 
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title.id
    end
    binding.pry
    if params["landmark"]["name"] != ""
      @landmark = Landmark.create(name: params["landmark"]["name"], figure_id: @figure.id)
    else 
      @landmark = Landmark.find(params["figure"]["landmark_ids"])
      @landmark.figure_id << @figure.id
    end 
  end
  
  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/edit'
  end
  
  patch '/figures/:id' do
    if !params[:figure].keys.include?("title_ids")
      params[:figure]["title_ids"] = []
    end
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["title"]["id"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params[:figure].keys.include?("landmark_ids")
      params[:figure]["landmark_ids"] = []
    end
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["landmark"]["id"].empty?
      @figure.landmarks << Landmark.create(name: params["title"]["name"])
    end
    redirect to "/figures/#{@figure.id}"
  end
end
