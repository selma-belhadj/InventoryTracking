require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    assign(:item, Item.create!(
      name: "Name",
      description: "MyText",
      price: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
  end
end
