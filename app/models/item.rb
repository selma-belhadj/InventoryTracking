class Item < ApplicationRecord
    has_many :item_locations, dependent: :destroy
    has_many :locations, through: :item_locations

end
