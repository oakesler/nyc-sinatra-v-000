class LandmarksController < ApplicationController
  get '/landmarks' do
    #binding.pry
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
  
  get '/landmarks/new' do
    erb :"landmarks/new"
  end
  
  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"].to_i)
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
  
  #get '/landmarks/:id' do 
  #@landmark = Landmark.all.find(params[:id])
    #erb :"landmarks/show"
  #end
end
