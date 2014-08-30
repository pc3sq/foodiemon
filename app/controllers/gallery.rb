# Route for showing all galleries for a Foody ==WORKING==
get '/galleries' do
  if session[:foody][:id]
	@galleries = Foody.find(session[:foody][:id]).galleries
  else
    redirect to ("/login")
  end
  
  erb :"/gallery/index"
end


# Route for getting form to create a new gallery ==WORKING==
get '/gallery/new' do
  if session[:foody][:id]
    erb :"/gallery/new"
  else

    redirect to ("/gallery/error")
  end
end


# Route to create a gallery ==WORKING==
post '/galleries' do
	foody = Foody.find(session[:foody][:id])
	if params[:gallery]
		gallery = Gallery.create(params[:gallery])
		foody.galleries << gallery
		gallery.pictures << Picture.create(params[:picture])

		redirect to ("/gallery/#{foody.galleries.find(gallery.id)}")
	else

		redirect to ("/gallery/errors/error")
	end
end


# Route showing a specific gallery ==WORKING==
get '/gallery/:id' do
	if session[:foody][:id] && Gallery.find(params[:id]).foody.id == session[:foody][:id]
		@gallery = Gallery.find(params[:id])
		@pictures = @gallery.pictures
		erb :"gallery/show"
	else
		redirect to ("/gallery/errors/error_not_your_gallery")
	end
end


# Route grabbing form to update a gallery. ==WORKING==
get '/gallery/:id/edit' do
  if session[:foody][:id] && Gallery.find(params[:id]).foody.id == session[:foody][:id]
		@gallery = Gallery.find(params[:id])
    	
    	erb :"/gallery/edit"
  else
  	
    redirect "/gallery/errors/error_not_your_gallery"
  end
end


# Route updating a gallery. ==WORKING==
put "/gallery/:id" do
	@gallery = Gallery.find(params[:id])
	@gallery.update(params[:gallery])

	redirect "/gallery/#{@gallery.id}"
end

# Route deleting gallery. ==WORKING==
delete "/gallery/:id" do
	if session[:foody][:id] && Gallery.find(params[:id]).foody.id == session[:foody][:id]
		Gallery.destroy(params[:id])

		redirect "/galleries"
  	else

    		redirect "/gallery/errors/error_not_your_gallery"
    	end
end


# Gallery Error messages ==WORKING==
get '/gallery/errors/error' do
  erb :"/gallery/errors/error"
end

get "/gallery/errors/error_not_your_gallery" do
	erb :"/gallery/errors/error_not_your_gallery"
end