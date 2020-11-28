# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'


# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# list_serialized = open(url).read
# ingredient_list = JSON.parse(list_serialized)

# ingredient_list["drinks"].each do |ingredient| #ingredient is a hash
    # name = ingredient["strIngredient1"]
    # Ingredient.create(name: name)
# end

puts "Cleaning database now..."
Ingredient.destroy_all
Cocktail.destroy_all
puts "Database clean ✅"

puts "Creating ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  item = Ingredient.create(name: ingredient["strIngredient1"])
  puts "#{item.name}"
end
puts "Done! Created #{Ingredient.count} ingredients."

# Cocktails

Cocktail.create(name: "Mojito")
Cocktail.create(name: "Tequila Sunrise")
Cocktail.create(name: "Cuba Libre")
Cocktail.create(name: "Cosmopolitan")
Cocktail.create(name: "Pisco Sour")
Cocktail.create(name: "Long Island Icetea")

