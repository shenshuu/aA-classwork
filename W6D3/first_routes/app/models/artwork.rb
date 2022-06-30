class Artwork < ApplicationRecord
    belongs_to :user,
        primary_key: :id, 
        foreign_key: :artist_id,
        class_name: :User,
        dependent: :destroy 

    has_many :shares,
        primary_key: :id, 
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :shares,
        source: :user

    has_many :comments,
        primary_key: :id, 
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy
    
    validates :title, uniqueness: {scope: :artist_id}
end