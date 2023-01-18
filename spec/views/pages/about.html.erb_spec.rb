require 'rails_helper'

RSpec.describe 'pages/about.html.erb', type: :view do
  describe 'pages/about' do
    it "displays the title 'About us'" do
      render
      assert_select 'h1', 'About us'
      assert_select 'p', 'This is a simple inventory tracker app.'
    end
  end
end
