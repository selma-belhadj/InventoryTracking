require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'is valid with valid attributes' do
    location = Location.new(name: 'name', address: 'address', city: 'city')
    expect(location).to be_valid
  end

  it 'is not valid without a name' do
    location = Location.new(name: nil, address: 'address', city: 'city')
    expect(location).to be_invalid
  end

  it 'is not valid without an address' do
    location = Location.new(name: 'name', address: nil, city: 'city')
    expect(location).to be_invalid
  end

  it 'it is not valid without a city' do
    location = Location.new(name: 'name', address: 'address', city: nil)
    expect(location).to be_invalid
  end

  it 'is not valid with a name less than 3 characters' do
    location = Location.new(name: 'na', address: 'address', city: 'city')
    expect(location).to be_invalid
  end

  it 'is not valid with an address less than 3 characters' do
    location = Location.new(name: 'name', address: 'ad', city: 'city')
    expect(location).to be_invalid
  end

  it 'is not valid with a name that contains numbers' do
    location = Location.new(name: 'name1', address: 'address', city: 'city')
    expect(location).to be_invalid
  end
end
