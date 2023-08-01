class PublicRecipesController < ApplicationController
  def index
    @recipes_all = Recipe.all.includes(:user)
    @recipes_true = Recipe.where(public: true).order(created_at: :desc).includes(:user)

    @recipe_totals = {}

    @recipes_true.each do |recipe|
      @recipes_join = RecipeFood.joins(:food)
        .where(recipe_id: recipe.id)
        .select('recipe_foods.*, foods.name, foods.price')
        .references(:food)

      @recipes_join.each do |recipe_food|
        recipe_food.value = recipe_food.calculate_value
      end

      total_items_added = @recipes_join.size
      total_value = @recipes_join.sum(&:value)

      @recipe_totals[recipe.id] = { total_items_added:, total_value: }

      index_true = @recipes_all.find_index { |r| r.id == recipe.id }
      recipe.index_true = index_true + 1
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end
end
