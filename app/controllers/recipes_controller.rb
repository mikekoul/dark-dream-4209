class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipes = Recipe.find(params[:recipe_id])
  end
end