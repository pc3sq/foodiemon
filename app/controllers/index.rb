get '/' do
  erb :index
end

get '/login' do

  erb :login
end

post '/login' do
  foody = Foody.find_by(name: params[:foody][:name])
  if foody && foody.authenticate(params[:foody][:password])
    puts "Success"
    session[:id] = foody.id
    redirect to "/foody/#{session[:id]}"
  else
    puts "You suck"
    # Set errors based on validations
    redirect to '/login'
  end
end

get '/foody/:id' do
  "Hello World"
end
