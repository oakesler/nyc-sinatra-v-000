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
    if params["title"]["name"] != ""
      @title = Title.create(name: params["title"]["name"])
      @title.save
      @figure.title_ids << @title.id
    else
      @figure.title_ids << params["figure"]["title_ids"]
    end
    if params["landmark"]["name"] != ""
      @landmark = Landmark.create(name:params["landmark"]["name"])
      @landmark.save
      @figure.landmark_ids << @landmark.id
    else 
      @figure.landmark_ids << params["figure"]["landmark_ids"]
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
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


class OwnersController < ApplicationController

  post '/owners' do 
    @owner = Owner.create(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect "owners/#{@owner.id}"
  end

  get '/owners/:id/edit' do 
    @owner = Owner.find(params[:id])
    @pets = Pet.all
    erb :'/owners/edit'
  end

  get '/owners/:id' do 
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  patch '/owners/:id' do
    if !params[:owner].keys.include?("pet_ids")
      params[:owner]["pet_ids"] = []
    end
    @owner = Owner.find(params[:id])
    @owner.update(params["owner"])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect "owners/#{@owner.id}"
  end
end
