require 'rails_helper'

RSpec.describe "pages/home.html.erb", type: :view do
  describe "pages/home" do
    it "displays the title 'Inventory Tracker App!'" do
      render
      assert_select "h1", "Inventory Tracker App!"
    end
  end
end
