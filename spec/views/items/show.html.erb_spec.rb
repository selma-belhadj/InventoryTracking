require 'rails_helper'

RSpec.describe "items/show", type: :view do
  item1 = Item.create(name: "Name", description: "MyText", price: 9.99)
  location1 = Location.create(name: "location1")
  location2 = Location.create(name: "location2")
  ItemLocation.create(item: item1, location: location1, quantity: 10)
  ItemLocation.create(item: item1, location: location2, quantity: 5)

  before(:each) do
    assign(:item,  {
        id: item1.id,
        name: item1.name,
        description: item1.description,
        price: item1.price,
        loc_name: [
          { name: location1.name, quantity: 10 },
          { name: location2.name, quantity: 5 }
        ]
    })
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
  end
end
