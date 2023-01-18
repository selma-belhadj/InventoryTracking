require 'rails_helper'

RSpec.describe "items/index", type: :view do
  item1 = Item.create(name: "Name", description: "MyText", price: 9.99)
  item2 = Item.create(name: "Name", description: "MyText", price: 9.99)
  location1 = Location.create(name: "location1")
  location2 = Location.create(name: "location2")
  ItemLocation.create(item: item1, location: location1, quantity: 10)
  ItemLocation.create(item: item1, location: location2, quantity: 5)
  ItemLocation.create(item: item2, location: location2, quantity: 7)

  before(:each) do
    assign(:items, [
        {
          id: item1.id,
          name: item1.name,
          description: item1.description,
          price: item1.price,
          loc_name: [
            { name: location1.name, quantity: 10 },
            { name: location2.name, quantity: 5 }
          ]
        },
        {
          id: item2.id,
          name: item2.name,
          description: item2.description,
          price: item2.price,
          loc_name: [
            { name: location2.name, quantity: 7 }
          ]
        }
      ])

  end

  it "renders a list of items" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
