require 'rails_helper'

RSpec.describe 'ingredients index page' do
  it 'lists all ingredients and the number of recipes they are used in' do
    spaghetti = Recipe.create!(name: "Spaghetti", complexity: 1, genre: "Italian")
    gyro = Recipe.create!(name: "Gyro", complexity: 2, genre: "Greek")
    tapas = Recipe.create!(name: "Tapas", complexity: 3, genre: "Spanish")

    pasta = Ingredient.create!(name: "Pasta", cost: 5)
    meat = Ingredient.create!(name: "Meat", cost: 10)
    pita = Ingredient.create!(name: "Pita", cost: 3)

    spaghetti_pasta = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
    spaghetti_meat = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meat.id)
    gyro_pita = RecipeIngredient.create!(recipe_id: gyro.id, ingredient_id: pita.id)
    tapas_pita = RecipeIngredient.create!(recipe_id: tapas.id, ingredient_id: pita.id)

    visit "/ingredients"

    within "#ingredients-#{pasta.id}" do
      expect(page).to have_content("Recipes: 1")
    end

    within "#ingredients-#{meat.id}" do
      expect(page).to have_content("Recipes: 1")
    end

    within "#ingredients-#{pita.id}" do
      expect(page).to have_content("Recipes: 2")
    end
  end
end