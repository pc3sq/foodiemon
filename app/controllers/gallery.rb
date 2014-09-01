
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

		redirect to ("/gallery/#{gallery.id}")
	else

		redirect to ("/gallery/error")
	end
end

# Route showing a specific gallery
get '/gallery/:id' do
  @gallery = Gallery.find(params[:id])

	if session[:foody][:id] && @gallery.foody.id == session[:foody][:id]
		erb :"gallery/show"
	else
		redirect to ("/gallery/error_not_your_gallery")
	end
end

#error messages
get '/gallery/error' do
  erb :"/gallery/error"
end

get "/gallery/error_not_your_gallery" do
	erb :"/gallery/error_not_your_gallery"
end



get '/gallery/:id/edit' do
  @gallery = Gallery.find(params[:id])

  unless session[:foody][:id] && @gallery.foody.id == session[:foody][:id]
    redirect "/login"
  end
  
  erb :"/gallery/edit"
end

# post '/galleries' do
#   gallery = Gallery.create(params[:gallery])
#   session[:foody] = foody

#   redirect to("/gallery/#{session[:foody][:galleries][:id]}")
# end

# get '/foody/:id' do
#   "Hello World"
# end

# put '/foody/:id' do
#   redirect "/foody/#{session[:foody][:id]}"
# end

# get '/foody/:id/edit' do
#   if params[:id].to_i == session[:foody][:id]
#     erb :"/foody/edit"
#   else
#     redirect "/login"
#   end
# end
