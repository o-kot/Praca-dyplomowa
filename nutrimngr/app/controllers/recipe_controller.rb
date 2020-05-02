class RecipeController < ApplicationController
    def recipe
    end
    def add
        if params['name'].blank?
            render plain: 'Pole nazwa nie może być puste.' and return
        end     
        newRecipe = RecipeViewModel.new(session[:sessionID])
        if newRecipe.addRecipe(params['name']) == 'success' && params['goToProducts']

        elsif  newRecipe.addRecipe(params['name']) == 'success' && !params['goToProducts']
            session[:message]='Przepis został zapisany.'
            redirect_to '/recipes/recipes'  
        end       
    end
    def edit
    end
end