class ItemLocation < ApplicationRecord
  belongs_to :item
  belongs_to :location
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :item_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :location_id, presence: true,  uniqueness: { scope: :item_id },  numericality: { greater_than: 0, only_integer: true }
end
