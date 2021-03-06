class User < ApplicationRecord 
    has_many :artworks,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork 

    has_many :shares,
        primary_key: :id, 
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :shares, 
        source: :artwork

    has_many :comments,
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :Comment,
        dependent: :destroy
        
    validates :username, presence: true, uniqueness: true 
end