get '/pictures' do
  unless session[:foody]
    redirect "/"
  end

    @pics = Foody.find(session[:foody][:id]).pictures
    erb :"picture/index"
end

post '/pictures' do
  unless session[:foody]
    redirect "/"
  end

  new_pic = Picture.create(params[:picture])
  Foody.find(session[:foody][:id]).galleries.first.pictures << new_pic
  redirect to("/picture/#{new_pic.id}")
end

get '/pictures/new' do
  erb :"picture/new"
end

get '/picture/:id' do
  @pic = Picture.find(params[:id])
  erb :"picture/show"
end

delete 'picture/:id' do
  unless Picture.find(params[:id]).foody.id.to_i == session[:foody][:id]
    redirect "/"
  end

  Picture.destroy(params[:id])
  redirect '/pictures'
end
