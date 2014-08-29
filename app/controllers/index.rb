get '/' do
  erb :index
end

get '/login' do

  erb :login
end

post '/login' do
  "Hello World"
end
