require 'rails_helper'

RSpec.describe 'recipe index page' do
  it 'shows name/complexity/genre of each recipe' do
    spaghetti = Recipe.create!(name: "Spaghetti", complexity: 1, genre: "Italian")
    gyro = Recipe.create!(name: "Gyro", complexity: 2, genre: "Greek")
    tapas = Recipe.create!(name: "Tapas", complexity: 3, genre: "Spanish")

    visit "/recipes"

    within "#recipes-#{spaghetti.id}" do
      expect(page).to have_content("Name: Spaghetti")
      expect(page).to have_content("Complexity: 1")
      expect(page).to have_content("Genre: Italian")
    end

    within "#recipes-#{gyro.id}" do
      expect(page).to have_content("Name: Gyro")
      expect(page).to have_content("Complexity: 2")
      expect(page).to have_content("Genre: Greek")
    end

    within "#recipes-#{tapas.id}" do
      expect(page).to have_content("Name: Tapas")
      expect(page).to have_content("Complexity: 3")
      expect(page).to have_content("Genre: Spanish")
    end
  end
end