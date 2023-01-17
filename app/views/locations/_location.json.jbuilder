json.extract! location, :id, :name, :address, :city, :created_at, :updated_at
json.url location_url(location, format: :json)
