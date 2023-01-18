class Location < ApplicationRecord
    has_many :item_locations, dependent: :destroy
    has_many :items, through: :item_locations
    validates :name, presence: true, length: { minimum: 3 }, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters" }
    validates :address, presence: true, length: { minimum: 3 }
    validates :city, presence: true, length: { minimum: 3 }

end
