class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all
    @boo = "Boo!!"
    erb :"/landmarks/index"
  end
  
  get '/landmarks/new' do
    erb :"/landmarks/new"
  end
  
   post '/landmarks' do
     @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"].to_i)
     @landmark.save
     redirect to "/landmarks/#{@landmark.id}"
    end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end
  
   patch '/landmarks/:id' do
    if !params[:la].keys.include?("title_ids")
      params[:owner]["title_ids"] = []
    end
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["title"]["id"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    redirect to "/figures/#{@figure.id}"
  end
end

end
