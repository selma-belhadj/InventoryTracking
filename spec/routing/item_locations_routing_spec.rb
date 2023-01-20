require 'rails_helper'

RSpec.describe ItemLocationsController, type: :routing do
    describe 'routing' do
        it 'routes to #index' do
        expect(get: '/item_locations').to route_to('item_locations#index')
        end
    
        it 'routes to #new' do
        expect(get: '/item_locations/new').to route_to('item_locations#new')
        end
    
        it 'routes to #show' do
        expect(get: '/item_locations/1').to route_to('item_locations#show', id: '1')
        end
    
        it 'routes to #edit' do
        expect(get: '/item_locations/1/edit').to route_to('item_locations#edit', id: '1')
        end
    
        it 'routes to #create' do
        expect(post: '/item_locations').to route_to('item_locations#create')
        end
    
        it 'routes to #update via PUT' do
        expect(put: '/item_locations/1').to route_to('item_locations#update', id: '1')
        end
    
        it 'routes to #update via PATCH' do
        expect(patch: '/item_locations/1').to route_to('item_locations#update', id: '1')
        end
    
        it 'routes to #destroy' do
        expect(delete: '/item_locations/1').to route_to('item_locations#destroy', id: '1')
        end
    end

end