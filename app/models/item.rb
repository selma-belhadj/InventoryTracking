class Item < ApplicationRecord
    has_many :item_locations, dependent: :destroy
    has_many :locations, through: :item_locations
    validates :name, presence: true, length: { minimum: 3 }, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters" }
    validates :price, presence: true, numericality: { only_decimal: true, greater_than: 0 } 
end
