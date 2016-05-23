# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cuisine.create(name: "Indian")
Cuisine.create(name: "Thai")
Cuisine.create(name: "Italian")
Cuisine.create(name: "Vietnamese")
Cuisine.create(name: "Japanese")
Cuisine.create(name: "English")
Cuisine.create(name: "French")
table = Table.create(name: "Sachins Restaurant", spaces: 4, house_number: "14", street: "Badminton Close", city: "London", postcode: "UB54NA" )
meal = table.meals.create(menu: "Pasta", date: "2015-06-06", time: "20:00", places: 4, cuisine_id: 1 )
