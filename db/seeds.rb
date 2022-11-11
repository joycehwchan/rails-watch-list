require 'open-uri'
puts 'Destroying movies...'
Movie.destroy_all

# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

puts 'Creating movies...'
response['results'].each do |movie_hash|
  Movie.create!(
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie_hash['poster_path']}",
    rating: movie_hash['vote_average']
  )
end
puts "Created #{Movie.count} movies."

# List.destroy_all
# List.create!(name: "Action")
# List.create!(name: "Animation")
# List.create!(name: "Comedy")
# List.create!(name: "Crime")
# List.create!(name: "Drama")
# List.create!(name: "Fantasy")
# List.create!(name: "Historical")
# List.create!(name: "Horror")
# List.create!(name: "Romance")
# List.create!(name: "Sci-fi")
# List.create!(name: "Thriller")
# List.create!(name: "Documentary")

puts 'Destroying bookmarks...'
Bookmark.destroy_all

puts 'Creating bookmarks...'
120.times do
  Bookmark.create(
    comment: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
    movie: Movie.all.sample,
    list: List.all.sample
  )
end
puts "Created #{Bookmark.count} bookmarks."
