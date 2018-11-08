require 'json'
require 'open-uri'

Ingredient.destroy_all

ingredient_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(ingredient_url).read
ingredients = JSON.parse(ingredients_serialized)


ingredients["drinks"].each do |ingredient_hash|
  ingredient = Ingredient.new(name: ingredient_hash["strIngredient1"])
  ingredient.save
end
