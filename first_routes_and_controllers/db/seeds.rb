# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.delete_all
Artwork.delete_all
User.delete_all

users = []
20.times do |num|
  username = "#{Faker::TvShows::RickAndMorty.character}#{num}"
  users << User.create!(username: username)
end

artworks = []
users.each do |user|
  title = "#{Faker::TvShows::RickAndMorty.quote}"
  artworks << Artwork.create!(title: title, image_url: "http://image.com", artist_id: user.id)

end


until users.empty?
  user = users.shuffle.pop
  artwork = artworks.shuffle.pop
  ArtworkShare.create!(artwork_id: artwork.id, viewer_id: user.id)
end
