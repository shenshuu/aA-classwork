class Album < ApplicationRecord
    validates :band_id, :title, presence: true, uniqueness: true 
end