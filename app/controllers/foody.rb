get '/foody/new' do
  erb :"/foody/signup"
end

### CREATE ###

post '/foodies' do
  foody = Foody.create(params[:foody])
  session[:foody] = foody

  redirect to("/foody/#{session[:foody][:id]}")
end

get '/foody/:id' do
  unless session[:foody]
    redirect '/'
  end
  
  @foody = Foody.find(params[:id])
  erb :"/foody/home"
end

put '/foody/:id' do
  redirect "/foody/#{session[:foody][:id]}"
end

### UPDATE ###

get '/foody/:id/edit' do
  if params[:id].to_i == session[:foody][:id]
    erb :"/foody/edit"
  else
    redirect "/login"
  end
end

put '/foodies' do
  redirect "/foody/#{session[:foody][:id]}"
end

### DELETE ###

  delete '/foody/:id' do
    Foody.find(session[:foody][:id]).destroy

    redirect to('/')  
  end
