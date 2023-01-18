# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Location.create([
    {
        name: "LocationA",
        address: "1234 Main St",
        city: "San Francisco"
    },
    {
        name: "LocationB",
        address: "1234 Side St",
        city: "New York"
    },
    {
        name: "LocationC",
        address: "1234 Back St",
        city: "Los Angeles"
    }
])

items = Item.create([
    {
        name: "Phones",
        description: "Samsung Phones",
        price: 100
    },
    {
        name: "PCs",
        description: "Acer Phones",
        price: 700
    },
    {
        name: "Ipad",
        description: "Apple Device",
        price: 500
    },
]) 

item_locations = ItemLocation.create([
    {
        item_id: 1,
        location_id: 1,
        quantity: 10
    },
    {
        item_id: 1,
        location_id: 2,
        quantity: 5
    },
    {
        item_id: 2,
        location_id: 2,
        quantity: 30
    },
    {
        item_id: 2,
        location_id: 3,
        quantity: 20
    },
    {
        item_id: 3,
        location_id: 1,
        quantity: 15
    }
])

