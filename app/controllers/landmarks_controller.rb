class LandmarksController < ApplicationController
  
  get '/landmarks' do
    #binding.pry
    @landmarks = Landmark.all
    @boo = "Boo!!"
    erb :"landmarks/index"
  end
  
  get '/landmarks/new' do
    erb :"landmarks/new"
  end
  
   post '/landmarks' do
     @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"].to_i)
     @landmark.save
     redirect to "/landmarks/#{@landmark.id}"
    end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end
  
  get 'landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/figures/edit'
  end
    
end
