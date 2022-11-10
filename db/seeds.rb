require 'open-uri'
Movie.destroy_all
# List.destroy_all

# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|
  # puts
  # p movie_hash
  Movie.create!(
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie_hash['poster_path']}",
    rating: movie_hash['vote_average']
  )
end

# API_URL = "http://www.omdbapi.com/?apikey=6d8a8cb0"
# title = 'marvel'
# url = "http://www.omdbapi.com/?apikey=6d8a8cb0&s=#{title}"
# response = JSON.parse(URI.open(url).read)

# p response['Search'].each do |movie_hash|
#   p movie_hash
#   Movie.create!(title: movie_hash['Title'],
#                 overview: "Movie description for #{movie_hash['Title']}",
#                 poster_url: movie_hash['Poster'])
# end
