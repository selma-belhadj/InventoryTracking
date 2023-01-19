require 'rails_helper'

RSpec.describe 'ItemLocations', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/item_locations/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/item_locations/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/item_locations/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/item_locations/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
