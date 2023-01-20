require 'rails_helper'

RSpec.describe 'item_locations/index.html.erb', type: :view do
  let(:item) { Item.create(name: 'Name', description: 'MyText', price: 9.99) }
  let(:location) { Location.create(name: 'location1') }
  let(:item_location) { ItemLocation.create(item: item, location: location, quantity: 10) }

  before(:each) do
    assign(:item_locations, [
             item_location,
             ItemLocation.create(item: item, location: location, quantity: 5)
           ])
  end

  it 'renders a list of item_locations' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
  end
end
