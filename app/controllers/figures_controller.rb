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
    #binding.pry
    if params["figure"]["title_ids"] != ""
      params["figure"]["title_ids"].each do |item|
        @title = Title.find(item)
        @figure.titles << @title
      end
    elsif params["title"]["name"] != ""
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title.id
    else 
      @figure.save 
    end
    if !!params["landmark"]["name"].scan(/\w/) != ""
      @landmark = Landmark.create(name: params["landmark"]["name"], figure_id: @figure.id)
      elsif params["figure"]["landmark_ids"].count > 0 
      params["figure"]["landmark_ids"].each do |item|
        @landmark = Landmark.find(item)
        @landmark.figure_id << @figure.id
      end
    else 
      @figure.save
      end
    end
  
  #get '/figures/:id' do
    #@figure = Figure.find(params[:id])
    #erb :"/figures/show"
  #end
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/edit'
  end
  
  get '/figures/:id' do
    binding.pry
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
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
