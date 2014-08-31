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
  
  erb :"/foody/show"
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

# Could create route to redirect to signup if user is 
# not found in the database

put '/foodies' do
  redirect "/foody/#{session[:foody][:id]}"
end

### DELETE ###
# Delete account & redirect to signup page







