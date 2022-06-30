class User < ApplicationRecord 
    has_many :artworks,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork 

    validates :username, null: false, presence: true, uniqueness: true 
    
end