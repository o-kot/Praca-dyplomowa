class RecipeController < ApplicationController
    def recipe
    end
    def add
        if params['name'].blank?
            render plain: 'Pole nazwa nie może być puste.' and return
        end     
        newRecipe = RecipeViewModel.new(session[:sessionID])
        if newRecipe.addRecipe(params['name']) == 'success' && params['goToProducts']=='on'
            render plain: 'Add products' and return
        elsif  newRecipe.addRecipe(params['name']) == 'success' && !params['goToProducts']=='on'
            session[:message]='Przepis został zapisany.'
            redirect_to '/recipes/recipes'  
        end       
    end
    def addProduct
        newRecipeProduct = RecipeProductsViewModel.new(session[:sessionID])
        existingProductsList = ProductInfoViewModel.new(session[:sessionID])
        existingProductsList = existingProductsList.getProductList.each {|existing|existing.id}
        productsIDs = []
        params['product'].each do |product|
            if !existingProductsList.include?(product)
                render plain: 'Podany produkt nie istnieje' and return
            end
            if !productsIDs.include?(product['value'])
                newRecipeProduct.addProduct(params['recipe'],product['value'])
                productsIDs << product['value']
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
        newRecipe = RecipeProductsViewModel.new(session[:sessionID])
        if newRecipe.deleteRecipe(params['recipe']) == 'success'
            render plain: 'Przepis został usunięty.'
    end
    def deleteProduct
        recipeProduct = RecipeProductsViewModel.new(session[:sessionID])
        if recipeProduct.deleteProduct(params['recipe'],params['product']) == 'success'
            render plain: 'Ingredient deleted.'
        end
    end
end