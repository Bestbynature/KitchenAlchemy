class PublicRecipesController < ApplicationController
    def index
        @recipes = Recipe.where(public: true).includes(:user)
    end
    
    def show
        @recipe = Recipe.find_by(id: params[:id])
    end
end
