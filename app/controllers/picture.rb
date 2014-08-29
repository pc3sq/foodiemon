get '/picture' do
  erb :"picture/index"
end

get '/picture/:id' do
  erb :"picture/show"
end

post '/picture' do

  picture[:id]

  Picture.create(picture[:id])

  redirect to("/picture/#{picture[:id]}")
end


get '/picture' do
  erb :"picture/index"
end
