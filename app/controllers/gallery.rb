get '/gallery/:id' do
  unless session[:foody]
    redirect "/"
  end

  @pics = Foody.find(session[:foody][:id]).
          pictures.where(gallery: params[:id])

  erb :'/gallery/index'
  
end