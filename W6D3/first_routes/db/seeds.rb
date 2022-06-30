# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user1 = User.create(username: "Alice")
user2 = User.create(username: "Bob")
user3 = User.create(username: "Carol")
user4 = User.create(username: "David")
user5 = User.create(username: "Ethan")

Artwork.destroy_all
artwork1 = Artwork.create(title: "Mona Lisa", image_url: "art/monalisa", artist_id: user1.id)
artwork2 =Artwork.create(title: "Starry Night", image_url: "art/starrynight", artist_id: user2.id)
artwork3 =Artwork.create(title: "Death of Socrates", image_url: "art/socrates", artist_id: user3.id)
artwork4 =Artwork.create(title: "Relativity", image_url: "art/relativity", artist_id: user4.id)
artwork5 =Artwork.create(title: "Man On the Moon", image_url: "art/moon", artist_id: user5.id)

ArtworkShare.destroy_all
share1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user1.id)
share2 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user1.id)

Comment.destroy_all
comment1 = Comment.create(artwork_id: artwork1.id , user_id: user1.id, body: "food")
comment2 = Comment.create(artwork_id: artwork1.id , user_id: user1.id, body: "very nice")
comment3 = Comment.create(artwork_id: artwork2.id , user_id: user2.id, body: "looks good to me")