require 'rails_helper'

RSpec.describe 'item_locations/edit.html.erb', type: :view do
  let(:item) { Item.create(name: 'Name', description: 'MyText', price: 9.99) }
  let(:location) { Location.create(name: 'location1') }
  let(:item_location) { ItemLocation.create(item: item, location: location, quantity: 10) }

  before(:each) do
    assign(:item_location, item_location)
  end

  it 'renders the edit item_location form' do
    render

    assert_select 'form[action=?][method=?]', item_location_path(item_location), 'post' do
      assert_select 'input[name=?]', 'item_location[item_id]'

      assert_select 'input[name=?]', 'item_location[location_id]'

      assert_select 'input[name=?]', 'item_location[quantity]'
    end
  end
end
