get '/foody/new' do

  erb :"/foody/signup"
end

post '/foodies' do
  foody = Foody.create(params[:foody])
  session[:foody] = foody

  redirect to("/foody/#{session[:foody][:id]}")
end

get '/foody/:id' do
  "Hello World"
end

put '/foody/:id' do
  redirect "/foody/#{session[:foody][:id]}"
end

get '/foody/:id/edit' do
  if params[:id].to_i == session[:foody][:id]
    erb :"/foody/edit"
  else
    redirect "/login"
  end
end
