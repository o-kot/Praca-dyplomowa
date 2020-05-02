class RecipesController < ApplicationController
    def recipes
        if !session[:sessionID]
            redirect_to "index/index"
        end
        if session[:message]
            @message=session[:message]
            session[:message]=nil
        end
        @recipe = RecipeViewModel.new(session[:sessionID])
        @recipe.getRecipe
        @completeRecipes = CompleteRecipeViewModel.new(session[:sessionID])
        @completeRecipes.getCompleteRecipes
    end
end