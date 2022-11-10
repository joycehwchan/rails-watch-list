# require 'open-uri'
# Movie.destroy_all
# List.destroy_all

# the Le Wagon copy of the API
# url = 'http://tmdb.lewagon.com/movie/top_rated'
# response = JSON.parse(URI.open(url).read)

# response['results'].each do |movie_hash|
#   Movie.create!(
#     title: movie_hash['title'],
#     overview: movie_hash['overview'],
#     poster_url: "https://image.tmdb.org/t/p/w500#{movie_hash['poster_path']}",
#     rating: movie_hash['vote_average']
#   )
# end


Bookmark.destroy_all

100.times do
  Bookmark.create(
    comment: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
    movie: Movie.all.sample,
    list: List.all.sample
  )
end
