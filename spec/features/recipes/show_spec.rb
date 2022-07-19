require 'rails_helper'

RSpec.describe 'recipe show page' do
  it 'lists the ingredients of the recipe' do
    spaghetti = Recipe.create!(name: "Spaghetti", complexity: 1, genre: "Italian")

    pasta = Ingredient.create!(name: "Pasta", cost: 5)
    meat = Ingredient.create!(name: "Meat", cost: 10)
    cheese = Ingredient.create!(name: "Cheese", cost: 15)
    hummus = Ingredient.create!(name: "Humus", cost:8)

    spaghetti_pasta = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
    spaghetti_meat = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meat.id)
    spaghetti_cheese = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: cheese.id)


    visit "/recipes/#{spaghetti.id}"

    expect(page).to have_content("Pasta")
    expect(page).to have_content("Meat")
    expect(page).to have_content("Cheese")
    expect(page).to_not have_content("Humus")
  end

  it 'lists the ingredients of the recipe' do
    spaghetti = Recipe.create!(name: "Spaghetti", complexity: 1, genre: "Italian")

    pasta = Ingredient.create!(name: "Pasta", cost: 5)
    meat = Ingredient.create!(name: "Meat", cost: 10)
    cheese = Ingredient.create!(name: "Cheese", cost: 15)
    
    spaghetti_pasta = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
    spaghetti_meat = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meat.id)
    spaghetti_cheese = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: cheese.id)


    visit "/recipes/#{spaghetti.id}"

    expect(page).to have_content("Total Cost: 30")
  end
end