get '/pictures' do
  unless session[:foody][:id]
    redirect "/"
  end

    @pics = Foody.find(session[:foody][:id]).pictures
    erb :"picture/index"
end

get '/pictures/new' do
  erb :"picture/new"
end

get '/picture/:id' do
  @pic = Picture.find(params[:id])
  erb :"picture/show"
end

post '/picture' do

  picture[:id]

  Picture.create(picture[:id])

  redirect to("/picture/#{picture[:id]}")
end
