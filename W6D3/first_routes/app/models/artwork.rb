class Artwork < ApplicationRecord
    belongs_to :user,
        primary_key: :id, 
        foreign_key: :artist_id,
        class_name: :User 

    validates :title, uniqueness: {scope: :artist_id}
end