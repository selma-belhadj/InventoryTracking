require 'rails_helper'

RSpec.describe ItemLocation, type: :model do
  describe 'Quantity validations' do
    item = Item.create(name: 'Eggs', price: 1)
    location = Location.create(name: 'Test', address: '123 Test St', city: 'Testville')

    it 'does not have a valid quantity' do
      item_location = ItemLocation.new(quantity: nil, item_id: item.id, location_id: location.id)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:quantity]).to include("can't be blank")
    end

    it 'Quantity should be a number' do
      item_location = ItemLocation.new(quantity: 'a', item_id: item.id, location_id: location.id)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:quantity]).to include('is not a number')
    end

    it 'Quantity should be of a positive integer' do
      item_location = ItemLocation.new(quantity: -1, item_id: item.id, location_id: location.id)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:quantity]).to include('must be greater than or equal to 0')
    end

    it 'Quantity should be of a positive integer' do
      item_location = ItemLocation.new(quantity: -1.9, item_id: item.id, location_id: location.id)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:quantity]).to include('must be an integer')
    end
  end

  describe 'Item ID validations' do
    location = Location.create(name: 'Test', address: '123 Test St', city: 'Testville')

    it 'does not have a valid item id' do
      item_location = ItemLocation.new(quantity: 3, item_id: nil, location_id: location.id)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:item_id]).to include("can't be blank")
    end

    it 'Item Id should be a number' do
      item_location = ItemLocation.new(quantity: 3, item_id: 'a', location_id: location.id)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:item_id]).to include('is not a number')
    end

    it 'Item Id should be of a positive integer' do
      item_location = ItemLocation.new(quantity: 1, item_id: -1, location_id: location.id)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:item_id]).to include('must be greater than 0')
    end

    it 'Item Id should be of a positive integer' do
      item_location = ItemLocation.new(quantity: 3, item_id: -1.9, location_id: location.id)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:item_id]).to include('must be an integer')
    end
  end

  describe 'Location ID validations' do
    item = Item.create(name: 'Eggs', price: 1)

    it 'does not have a valid item id' do
      item_location = ItemLocation.new(quantity: 3, item_id: item.id, location_id: nil)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:location_id]).to include("can't be blank")
    end

    it 'Location Id should be a number' do
      item_location = ItemLocation.new(quantity: 3, item_id: item.id, location_id: 'a')
      expect(item_location).to_not be_valid
      expect(item_location.errors[:location_id]).to include('is not a number')
    end

    it 'Location Id should be of a positive integer' do
      item_location = ItemLocation.new(quantity: 1, item_id: item.id, location_id: -1)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:location_id]).to include('must be greater than 0')
    end

    it 'Location Id should be of a positive integer' do
      item_location = ItemLocation.new(quantity: 3, item_id: item.id, location_id: -1.9)
      expect(item_location).to_not be_valid
      expect(item_location.errors[:location_id]).to include('must be an integer')
    end
  end
end
