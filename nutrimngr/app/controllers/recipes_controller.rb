class RecipesController < ApplicationController
    def recipes
        if !session[:sessionID]
            redirect_to "index/index"
        end
        if session[:message]
            @message=session[:message]
            session[:message]=nil
        end
        @recipes = RecipeViewModel.new(session[:sessionID])
        @recipes = @recipes.getRecipeList
        @completeRecipes = CompleteRecipeViewModel.new(session[:sessionID])
        @completeRecipes = @completeRecipes.getCompleteRecipeList
    end
end