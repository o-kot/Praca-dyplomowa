class RecipesPg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def getRecipeList
        recipes = RecipeDbModel.where(IDU:@userID)
    end
    def addRecipe(name)
        if RecipeDbModel.where(Name:name).exists?
            return 'Przepis o takiej nazwie istnieje już w bazie danych.'
        else
            newRecipe = RecipeDbModel.new
            newRecipe.IDU = @userID
            newRecipe.Name = name
            newRecipe.IsActive = true
            newRecipe.save
        return 'success'
    end
    def editRecipe(recipe,name) 
        if RecipeDbModel.where(Name:name).exists?
            return 'Przepis o takiej nazwie istnieje już w bazie danych.'
        else
            recipe = RecipeDbModel.find(recipe)
            recipe.update_attributes(Name:name)
            return 'success'
        end
    end
    def deleteRecipe(id) 
        recipe = RecipeDbModel.where(id:id).first
        recipe.update_attributes(IsActive:false)
        return 'success'
    end
    def find(recipe)
        recipe = RecipeDbModel.where(id:recipe).first        
    end
    def addProduct(recipe,product)
        newRecipeProduct = RecipeProductsDbModel.new
        newRecipeProduct.IDP = product
        newRecipeProduct.IDR = recipe
        newRecipeProduct.save
        return 'success'
    end
    def deleteProduct(recipe,product)
        recipeProduct = RecipeProductsDbModel.where(IDR:recipe,IDP:product).first
        recipeProduct.delete
        return 'success'
    end
    def weightProduct(recipe,product,weight)
        newRecipeProduct = RecipeProductsDbModel.where(IDR:id,IDP:product).first
        newRecipeProduct.weight = weight
        newRecipeProduct.save
        return 'success'
    end
    def getProductList(recipe)
        productList = RecipeProductsDbModel.where(IDR:recipe).map do |products| 
            {
                id:products.IDP,
                weight:products.Weight
            }
        ingredients = {}
        ingredientsWeight = {}
        productList.each do |product|
            ingredients[key]=ProductInfoDbModel.where(id:product.id).first
            ingredients[value]=product.Name
            ingredientWeight[key]=ProductInfoDbModel.where(id:product.id).first
            ingredientsWeight[value]=product.Weight
        end
        return {ingredients:ingredients,ingredientsWeight:ingredientsWeight}
    end
    def createCompleteRecipe(recipe)
        newCompleteRecipe = CompleteRecipeDbModel.new
        newCompleteRecipe.IDR = recipe
        newCompleteRecipe.IsActive = true
        newCompleteRecipe.IsWeighted = false
        newCompleteRecipe.HasPortions = false
        newCompleteRecipe.Calories = 0
        newCompleteRecipe.Protein = 0
        newCompleteRecipe.Carbs = 0
        newCompleteRecipe.Fat = 0
        newCompleteRecipe.save            
        return newCompleteRecipe.id
    end
    def calculateNutrition(recipe)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        productList = RecipeProductsDbModel.where(IDR:newCompleteRecipe.IDR).map do |products| 
            {
                id:products.IDP,
                weight:products.Weight
            }
        productList.each do |product|
            productInfo = ProductInfoDbModel.where(id:product.id).first
            newCompleteRecipe.Calories += productInfo.Calories * product.weight rescue newCompleteRecipe.Calories
            newCompleteRecipe.Protein += productInfo.Protein * product.weight rescue newCompleteRecipe.Protein
            newCompleteRecipe.Carbs += productInfo.Carbs * product.weight rescue newCompleteRecipe.Carbs
            newCompleteRecipe.Fat += productInfo.Fat * product.weight rescue newCompleteRecipe.Fat
            newCompleteRecipe.Sugars += productInfo.Sugars * product.weight rescue newCompleteRecipe.Sugars
            newCompleteRecipe.Fiber += productInfo.Fiber * product.weight rescue newCompleteRecipe.Fiber
            newCompleteRecipe.Omega3 += productInfo.Omega3 * product.weight rescue newCompleteRecipe.Omega3
            newCompleteRecipe.ALA += productInfo.ALA * product.weight rescue newCompleteRecipe.ALA
            newCompleteRecipe.SFA += productInfo.SFA * product.weight rescue newCompleteRecipe.SFA
            newCompleteRecipe.WNKT += productInfo.WNKT * product.weight rescue newCompleteRecipe.WNKT
            newCompleteRecipe.Trans += productInfo.Trans * product.weight rescue newCompleteRecipe.Trans
            newCompleteRecipe.Cholesterol += productInfo.Cholesterol * product.weight rescue newCompleteRecipe.Cholesterol
            newCompleteRecipe.Valine += productInfo.Valine * product.weight rescue newCompleteRecipe.Valine
            newCompleteRecipe.Isoleucine += productInfo.Isoleucine * product.weight rescue newCompleteRecipe.Isoleucine
            newCompleteRecipe.Leucine += productInfo.Leucine * product.weight rescue newCompleteRecipe.Leucine
            newCompleteRecipe.Lysine += productInfo.Lysine * product.weight rescue newCompleteRecipe.Lysine
            newCompleteRecipe.Methionine += productInfo.Methionine * product.weight rescue newCompleteRecipe.Methionine
            newCompleteRecipe.Threonine += productInfo.Threonine * product.weight rescue newCompleteRecipe.Threonine
            newCompleteRecipe.Tryptophan += productInfo.Tryptophan * product.weight rescue newCompleteRecipe.Tryptophan
            newCompleteRecipe.Phenylalanine += productInfo.Phenylalanine * product.weight rescue newCompleteRecipe.Phenylalanine
            newCompleteRecipe.VitA += productInfo.VitA * product.weight rescue newCompleteRecipe.VitA
            newCompleteRecipe.VitB1 += productInfo.VitB1 * product.weight rescue newCompleteRecipe.VitB1
            newCompleteRecipe.VitB2 += productInfo.VitB2 * product.weight rescue newCompleteRecipe.VitB2
            newCompleteRecipe.VitB3 += productInfo.VitB3 * product.weight rescue newCompleteRecipe.VitB3
            newCompleteRecipe.VitB4 += productInfo.VitB4 * product.weight rescue newCompleteRecipe.VitB4
            newCompleteRecipe.VitB5 += productInfo.VitB5 * product.weight rescue newCompleteRecipe.VitB5
            newCompleteRecipe.VitB6 += productInfo.VitB6 * product.weight rescue newCompleteRecipe.VitB6
            newCompleteRecipe.VitB9 += productInfo.VitB9 * product.weight rescue newCompleteRecipe.VitB9
            newCompleteRecipe.VitB12 += productInfo.VitB12 * product.weight rescue newCompleteRecipe.VitB12
            newCompleteRecipe.VitC += productInfo.VitC * product.weight rescue newCompleteRecipe.VitC
            newCompleteRecipe.VitD += productInfo.VitD * product.weight rescue newCompleteRecipe.VitD
            newCompleteRecipe.VitE += productInfo.VitE * product.weight rescue newCompleteRecipe.VitE
            newCompleteRecipe.VitH += productInfo.VitH * product.weight rescue newCompleteRecipe.VitH
            newCompleteRecipe.VitK += productInfo.VitK * product.weight rescue newCompleteRecipe.VitK
            newCompleteRecipe.Cl += productInfo.Cl * product.weight rescue newCompleteRecipe.Cl
            newCompleteRecipe.Zn += productInfo.Zn * product.weight rescue newCompleteRecipe.Zn 
            newCompleteRecipe.F += productInfo.F * product.weight rescue newCompleteRecipe.F
            newCompleteRecipe.P += productInfo.P * product.weight rescue newCompleteRecipe.P
            newCompleteRecipe.I += productInfo.I * product.weight rescue newCompleteRecipe.I
            newCompleteRecipe.Mg += productInfo.Mg * product.weight rescue newCompleteRecipe.Mg
            newCompleteRecipe.Cu += productInfo.Cu * product.weight rescue newCompleteRecipe.Cu 
            newCompleteRecipe.K += productInfo.K * product.weight rescue newCompleteRecipe.K
            newCompleteRecipe.Se += productInfo.Se * product.weight rescue newCompleteRecipe.Se
            newCompleteRecipe.Na += productInfo.Na  * product.weight rescue newCompleteRecipe.Na
            newCompleteRecipe.Ca += productInfo.Ca * product.weight rescue newCompleteRecipe.Ca
            newCompleteRecipe.Fe += productInfo.Fe * product.weight rescue newCompleteRecipe.Fe
        end
        newCompleteRecipe.save
        return 'success'
    end
    def measureRecipe(recipe,how,measurement)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        if how == 'weight'
            newCompleteRecipe.IsWeighted = true
            newCompleteRecipe.Weight = measurement
            newCompleteRecipe.save
        elsif how == 'portions'
            newCompleteRecipe.HasPortions = true
            newCompleteRecipe.HowManyPortions = measurement
            newCompleteRecipe.save
        else "Error: data has an invalid value (#{how})"
        end
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
        completeRecipes = RecipeDbModel.where(IDR:recipes,IsActive:true)
    end
    def markAsEaten(recipe)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        newCompleteRecipe.IsActive = false
        newCompleteRecipe.save
        return 'success'
    end
end