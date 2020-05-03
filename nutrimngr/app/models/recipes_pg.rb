class RecipesPg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def getRecipeList
        recipes = RecipeDbModel.where(IDU:@userID)
    end
    def addRecipe(name)
        newRecipe = RecipeDbModel.new
        newRecipe.IDU = @userID
        newRecipe.Name = name
        newRecipe.IsActive = true
        newRecipe.save
        return 'success'
    end
    def editRecipe(id) 
        
    end
    def deleteRecipe(id) 
        
    end
    def deleteRecipe(id) 
        
    end
    def addProduct(recipe,product)
        newRecipeProduct = RecipeProductsDbModel.new
        newRecipeProduct.IDP = product
        newRecipeProduct.IDR - recipe
        newRecipeProduct.save
        return 'success'
    end
    def deleteProduct(recipe,product)

    end
    def weightProduct(id,weight)
        newRecipeProduct = RecipeProductsDbModel.where(id:id).first
        newRecipeProduct.weight = weight
        newRecipeProduct.save
        return 'success'
    end
    def getProductList(recipe)

    end
    def createCompleteRecipe(id)
        newCompleteRecipe = CompleteRecipeDbModel.new
        newCompleteRecipe.IDR = id
        newCompleteRecipe.save
        return 'success'
    end
    def calculateNutrition(recipe)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        newCompleteRecipe.save
        return 'success'
    end
    def calculateWhatsLeft(recipe,eaten)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        newCompleteRecipe.WhatIsLeft=-eaten
        if WhatIsLeft <= 0
            newCompleteRecipe.IsActive = false
        newCompleteRecipe.save
        end
        return 'success'
    end
    def getCompleteRecipeList
        recipes = RecipeDbModel.where(IDU:@userID).map{|r| r.id}
        completeRecipes = RecipeDbModel.where(IDR:recipes)
    end
    def markAsEaten(recipe)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        newCompleteRecipe.IsActive = false
        newCompleteRecipe.save
        return 'success'
    end
end