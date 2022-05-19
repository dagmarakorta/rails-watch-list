require "json"
require "open-uri"

url = 'https://tmdb.lewagon.com/movie/top_rated'
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)["results"]

movies.each do |movie|
  title = movie["original_title"]
  overview = movie["overview"]
  rating = movie["vote_average"]
  poster_url = "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  Movie.create(title: title, overview: overview, rating: rating, poster_url: poster_url)
end
