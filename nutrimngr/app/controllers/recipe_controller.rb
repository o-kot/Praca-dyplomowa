class RecipeController < ApplicationController
    def recipe
    end
    def add
        if params['name'].blank?
            render plain: 'Pole nazwa nie może być puste.' and return
        end     
        newRecipe = RecipeViewModel.new(session[:sessionID])
        added = newRecipe.addRecipe(params['name'])
        if added == 'success' && params['goToProducts']=='on'
            render plain: 'Add products' and return
        elsif  added == 'success' && params['goToProducts']!='on'
            session[:message]='Przepis został zapisany.'
            redirect_to '/recipes/recipes' 
        else
            render plain: added
        end       
    end
    def addProduct
        newRecipeProduct = RecipeProductsViewModel.new(session[:sessionID])
        existingProductsList = ProductInfoViewModel.new(session[:sessionID])
        existingProductsList = existingProductsList.getProductList 
        productNames = []
        params['product'].each do |product|
            if !existingProductsList.map {|existing|existing.Name}.include?(product)
                render plain: 'Podany produkt nie istnieje' and return
            end
            if !productNames.include?(product)
                productID = existingProductsList.find{|p| p.Name == product}.id
                newRecipeProduct.addProduct(params['recipe'],productID)                
                productNames << product
            end
        end
        session[:message]='Dodano składniki do przepisu.'
        redirect_to '/recipes/recipes' 
    end
    def edit
        if params['Name'].blank?
            render plain: 'Pole nazwa nie może być puste.' and return
        end
        newRecipe = RecipeViewModel.new(session[:sessionID])
            if newRecipe.editRecipe(params['recipe'],params['Name']) == 'success'
                render plain: 'Edited name' and return
            end
    end
    def delete
        newRecipe = RecipeViewModel.new(session[:sessionID])
        if newRecipe.deleteRecipe(params['recipe']) == 'success'
            session[:message]='Przepis został usunięty.'
            redirect_to '/recipes/recipes' 
        end
    end
    def deleteProduct
        recipeProduct = RecipeProductsViewModel.new(session[:sessionID])
        if recipeProduct.deleteProduct(params['recipe'],params['product']) == 'success'
            render plain: 'Ingredient deleted.'
        end
    end
end