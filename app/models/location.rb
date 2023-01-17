class Location < ApplicationRecord
    has_many :item_locations, dependent: :destroy
    has_many :items, through: :item_locations
end
