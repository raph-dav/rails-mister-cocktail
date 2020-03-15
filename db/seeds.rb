# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts 'destroying all ingredients'
Ingredient.destroy_all

puts 'creating new ingredients'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktails_opened = open(url).read
cocktails_parsed = JSON.parse(cocktails_opened)

cocktails_parsed["drinks"].each do |ingredient|
  new_ingredient = Ingredient.new(name: ingredient["strIngredient1"])
  new_ingredient.save
end

puts "I'm done! you have 10 new ingredients in your DB"
