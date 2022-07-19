require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe '#model methods' do
    it 'counts the number of recipes an ingredient is used in' do
    pita = Ingredient.create!(name: "Pita", cost: 3)

    gyro = Recipe.create!(name: "Gyro", complexity: 2, genre: "Greek")
    tapas = Recipe.create!(name: "Tapas", complexity: 3, genre: "Spanish")

    gyro_pita = RecipeIngredient.create!(recipe_id: gyro.id, ingredient_id: pita.id)
    tapas_pita = RecipeIngredient.create!(recipe_id: tapas.id, ingredient_id: pita.id)

    expect(pita.recipe_count).to eq(2)
    end
  end
end
