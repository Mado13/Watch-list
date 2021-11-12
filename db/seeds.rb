# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated'
serialized = URI.open(url).read
movies = JSON.parse(serialized)

movies['results'].each do |movie|
  base_image_url = 'https://image.tmdb.org/t/p/w200'
  image_url = "#{base_image_url}#{movie['poster_path']}"
  Movie.create(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: image_url )
end
