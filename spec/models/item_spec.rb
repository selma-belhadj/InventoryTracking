require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Name validations' do
    location = Location.create(name: "Test", address: "123 Test St", city: "Testville")
    # item_location = ItemLocation.new(item_id: @item.id, location_id: item_params[:location_id], quantity: item_params[:quantity])

    it 'does not have a valid name' do
      item = Item.new(name: nil, price: 1)
      # item = Item.new(name: nil, price: 1)
      expect(item).to_not be_valid
      
    end

    it 'name should be of length greater than or equal to 3' do
      item = Item.new(name: "", price: 1)
      expect(item).to_not be_valid
      expect(item.errors[:name]).to include("can't be blank")
      expect(item.errors[:name]).to include("is too short (minimum is 3 characters)")
    end

    it 'name should contain only letters' do
      item = Item.new(name: "I89", price: 1)
      expect(item).to_not be_valid
      expect(item.errors[:name]).to include("only allows letters")
    end
  end
  
  describe 'Price validations' do
    it 'does not have a valid price' do
      item = Item.new(name: "Eggs", price: nil)
      expect(item).to_not be_valid
      expect(item.errors[:price]).to include("can't be blank")
    end

    it 'Price should be a decimal' do
      item = Item.new(name: "Eggs", price: 'a')
      expect(item).to_not be_valid
      expect(item.errors[:price]).to include("is not a number")
    end

    it 'Price should be of a positive decimal' do
      item = Item.new(name: "Eggs", price: -1)
      expect(item).to_not be_valid
      expect(item.errors[:price]).to include("must be greater than 0")
    end
  end

end