get '/foody/new' do

  erb :"/foody/signup"
end

post '/foodies' do
  foody = Foody.create(params[:foody])
  session[:id] = foody.id

  redirect to("/foody/#{session[:id]}")
end

get '/foody/:id' do
  "Hello World"
end

