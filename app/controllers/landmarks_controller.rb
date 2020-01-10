class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
  
  get '/landmarks/new' do 
    erb :"landmarks/new"
  end
  
  post '/landmarks' do
    @landmark = Landmark.new[name: params["name"]]
    redirect to "/landmarks/#{@landmark.id}"
  end
  
  get '/landmarks/:id' do 
    @landmark = Landmark.all.find(params[:id])
    erb :"landmarks/show"
  end
end
