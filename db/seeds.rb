# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

table = Table.create(name: "Sachins Restaurant", spaces: 4, house_number: "14", street: "Badminton Close", city: "London", postcode: "UB54NA" )
meal = table.meals.create(menu: "Pasta", date: "2015-06-06", time: "20:00", places: 4, cuisine: "French")
meal = table.meals.create(menu: "Pizza", date: "2015-07-07", time: "19:00", places: 6, cuisine: "English")
meal = table.meals.create(menu: "Fish and Chips", date: "2015-06-05", time: "20:30", places: 2, cuisine: "Italian")
