require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      name: "MyString",
      address: "MyString",
      city: "MyString"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input[name=?]", "location[name]"

      assert_select "input[name=?]", "location[address]"

      assert_select "input[name=?]", "location[city]"
    end
  end
end
