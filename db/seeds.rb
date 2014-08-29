require 'faker'

5.times do
  Foody.create(name: Faker::Name.first_name, password: "FoodyFoo")
end

Foody.all.each do |foody|
  foody.galleries << Gallery.create(name: Faker::Company.name)
end

Gallery.all.each do |gallery|
  gallery.pictures << Picture.create(name: Faker::Lorem.word, url: Faker::Internet.url)
end
