require 'rails_helper'

RSpec.describe 'item_locations/show.html.erb', type: :view do
  let(:item) { Item.create(name: 'Name', description: 'MyText', price: 9.99) }
  let(:location) { Location.create(name: 'location1') }
  let(:item_location) { ItemLocation.create(item: item, location: location, quantity: 10) }

  before(:each) do
    assign(:item_location, item_location)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/location1/)
    expect(rendered).to match(/10/)
  end
end
