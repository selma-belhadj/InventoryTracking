class AddUniqueIndexToItemLocations < ActiveRecord::Migration[7.0]
  def change
    add_index :item_locations, [:location_id, :item_id], unique: true
  end
end
