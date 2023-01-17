class CreateItemLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :item_locations do |t|
      t.integer :quantity
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
