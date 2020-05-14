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
    def findLast
        last = CompleteRecipeDbModel.where(IDU:@userID).last
        return last
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
        end
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
        end
        productList.each do |product|
            productInfo = ProductInfoDbModel.where(id:product.id).first
            newCompleteRecipe.Calories = newCompleteRecipe.Calories.nil? ? 0 : newCompleteRecipe.Calories + productInfo.Calories * product.weight rescue newCompleteRecipe.Calories
            newCompleteRecipe.Protein = newCompleteRecipe.Protein.nil? ? 0 : newCompleteRecipe.Protein + productInfo.Protein * product.weight rescue newCompleteRecipe.Protein
            newCompleteRecipe.Carbs = newCompleteRecipe.Carbs.nil? ? 0 : newCompleteRecipe.Carbs + productInfo.Carbs * product.weight rescue newCompleteRecipe.Carbs
            newCompleteRecipe.Fat = newCompleteRecipe.Fat.nil? ? 0 : newCompleteRecipe.Fat + productInfo.Fat * product.weight rescue newCompleteRecipe.Fat
            newCompleteRecipe.Sugars = newCompleteRecipe.Sugars.nil? ? 0 : newCompleteRecipe.Sugars + productInfo.Sugars * product.weight rescue newCompleteRecipe.Sugars
            newCompleteRecipe.Fiber = newCompleteRecipe.Fiber.nil? ? 0 : newCompleteRecipe.Fiber  + productInfo.Fiber * product.weight rescue newCompleteRecipe.Fiber
            newCompleteRecipe.Omega3 = newCompleteRecipe.Omega3.nil? ? 0 : newCompleteRecipe.Omega3 + productInfo.Omega3 * product.weight rescue newCompleteRecipe.Omega3
            newCompleteRecipe.ALA = newCompleteRecipe.ALA.nil? ? 0 : newCompleteRecipe.ALA + productInfo.ALA * product.weight rescue newCompleteRecipe.ALA
            newCompleteRecipe.SFA = newCompleteRecipe.SFA.nil? ? 0 : newCompleteRecipe.SFA + productInfo.SFA * product.weight rescue newCompleteRecipe.SFA
            newCompleteRecipe.WNKT = newCompleteRecipe.WNKT.nil? ? 0 : newCompleteRecipe.WNKT + productInfo.WNKT * product.weight rescue newCompleteRecipe.WNKT
            newCompleteRecipe.Trans = newCompleteRecipe.Trans.nil? ? 0 : newCompleteRecipe.Trans + productInfo.Trans * product.weight rescue newCompleteRecipe.Trans
            newCompleteRecipe.Cholesterol = newCompleteRecipe.Cholesterol.nil? ? 0 : newCompleteRecipe.Cholesterol + productInfo.Cholesterol * product.weight rescue newCompleteRecipe.Cholesterol
            newCompleteRecipe.Valine =  newCompleteRecipe.Valine.nil? ? 0 : newCompleteRecipe.Valine + productInfo.Valine * product.weight rescue newCompleteRecipe.Valine
            newCompleteRecipe.Isoleucine = newCompleteRecipe.Isoleucine.nil? ? 0 : newCompleteRecipe.Isoleucine + productInfo.Isoleucine * product.weight rescue newCompleteRecipe.Isoleucine
            newCompleteRecipe.Leucine = newCompleteRecipe.Leucine.nil? ? 0 : newCompleteRecipe.Leucine + productInfo.Leucine * product.weight rescue newCompleteRecipe.Leucine
            newCompleteRecipe.Lysine = newCompleteRecipe.Lysine.nil? ? 0 : newCompleteRecipe.Lysine + productInfo.Lysine * product.weight rescue newCompleteRecipe.Lysine
            newCompleteRecipe.Methionine = newCompleteRecipe.Methionine.nil? ? 0 : newCompleteRecipe.Methionine + productInfo.Methionine * product.weight rescue newCompleteRecipe.Methionine
            newCompleteRecipe.Threonine = newCompleteRecipe.Threonine.nil? ? 0 : newCompleteRecipe.Threonine + productInfo.Threonine * product.weight rescue newCompleteRecipe.Threonine
            newCompleteRecipe.Tryptophan = newCompleteRecipe.Tryptophan.nil? ? 0 : newCompleteRecipe.Tryptophan + productInfo.Tryptophan * product.weight rescue newCompleteRecipe.Tryptophan
            newCompleteRecipe.Phenylalanine = newCompleteRecipe.Phenylalanine.nil? ? 0 : newCompleteRecipe.Phenylalanine + productInfo.Phenylalanine * product.weight rescue newCompleteRecipe.Phenylalanine
            newCompleteRecipe.VitA = newCompleteRecipe.VitA.nil? ? 0 : newCompleteRecipe.VitA + productInfo.VitA * product.weight rescue newCompleteRecipe.VitA
            newCompleteRecipe.VitB1 = newCompleteRecipe.VitB1.nil? ? 0 : newCompleteRecipe.VitB1 + productInfo.VitB1 * product.weight rescue newCompleteRecipe.VitB1
            newCompleteRecipe.VitB2 = newCompleteRecipe.VitB2.nil? ? 0 : newCompleteRecipe.VitB2 + productInfo.VitB2 * product.weight rescue newCompleteRecipe.VitB2
            newCompleteRecipe.VitB3 = newCompleteRecipe.VitB3.nil? ? 0 : newCompleteRecipe.VitB3 + productInfo.VitB3 * product.weight rescue newCompleteRecipe.VitB3
            newCompleteRecipe.VitB4 = newCompleteRecipe.VitB4.nil? ? 0 : newCompleteRecipe.VitB4 + productInfo.VitB4 * product.weight rescue newCompleteRecipe.VitB4
            newCompleteRecipe.VitB5 = newCompleteRecipe.VitB5.nil? ? 0 : newCompleteRecipe.VitB5 + productInfo.VitB5 * product.weight rescue newCompleteRecipe.VitB5
            newCompleteRecipe.VitB6 = newCompleteRecipe.VitB6.nil? ? 0 : newCompleteRecipe.VitB6 + productInfo.VitB6 * product.weight rescue newCompleteRecipe.VitB6
            newCompleteRecipe.VitB9 = newCompleteRecipe.VitB9.nil? ? 0 : newCompleteRecipe.VitB9 + productInfo.VitB9 * product.weight rescue newCompleteRecipe.VitB9
            newCompleteRecipe.VitB12 = newCompleteRecipe.VitB12.nil? ? 0 : newCompleteRecipe.VitB12 + productInfo.VitB12 * product.weight rescue newCompleteRecipe.VitB12
            newCompleteRecipe.VitC = newCompleteRecipe.VitC.nil? ? 0 : newCompleteRecipe.VitC + productInfo.VitC * product.weight rescue newCompleteRecipe.VitC
            newCompleteRecipe.VitD = newCompleteRecipe.VitD.nil? ? 0 : newCompleteRecipe.VitD + productInfo.VitD * product.weight rescue newCompleteRecipe.VitD
            newCompleteRecipe.VitE = newCompleteRecipe.VitE.nil? ? 0 : newCompleteRecipe.VitE + productInfo.VitE * product.weight rescue newCompleteRecipe.VitE
            newCompleteRecipe.VitH = newCompleteRecipe.VitH.nil? ? 0 : newCompleteRecipe.VitH + productInfo.VitH * product.weight rescue newCompleteRecipe.VitH
            newCompleteRecipe.VitK = newCompleteRecipe.VitK.nil? ? 0 : newCompleteRecipe.VitK + productInfo.VitK * product.weight rescue newCompleteRecipe.VitK
            newCompleteRecipe.Cl = newCompleteRecipe.Cl.nil? ? 0 : newCompleteRecipe.Cl + productInfo.Cl * product.weight rescue newCompleteRecipe.Cl
            newCompleteRecipe.Zn = newCompleteRecipe.Zn.nil? ? 0: newCompleteRecipe.Zn + productInfo.Zn * product.weight rescue newCompleteRecipe.Zn
            newCompleteRecipe.F = newCompleteRecipe.F.nil? ? 0 : ewCompleteRecipe.F + productInfo.F * product.weight rescue newCompleteRecipe.F
            newCompleteRecipe.P = newCompleteRecipe.P.nil? ? 0 : newCompleteRecipe.P + productInfo.P * product.weight rescue newCompleteRecipe.P
            newCompleteRecipe.I = newCompleteRecipe.I.nil? ? 0 : newCompleteRecipe.I + productInfo.I * product.weight rescue newCompleteRecipe.I
            newCompleteRecipe.Mg = ewCompleteRecipe.Mg.nil? ? 0 : ewCompleteRecipe.Mg + productInfo.Mg * product.weight rescue newCompleteRecipe.Mg
            newCompleteRecipe.Cu = newCompleteRecipe.Cu.nil? ? 0 : newCompleteRecipe.Cu + productInfo.Cu * product.weight rescue newCompleteRecipe.Cu
            newCompleteRecipe.K = newCompleteRecipe.K.nil? ? 0 : newCompleteRecipe.K + productInfo.K * product.weight rescue newCompleteRecipe.K
            newCompleteRecipe.Se = newCompleteRecipe.Se.nil? ? 0 : newCompleteRecipe.Se + productInfo.Se * product.weight rescue newCompleteRecipe.Se
            newCompleteRecipe.Na = newCompleteRecipe.Na.nil? ? 0 : newCompleteRecipe.Na + productInfo.Na  * product.weight rescue newCompleteRecipe.Na
            newCompleteRecipe.Ca = newCompleteRecipe.Ca.nil? ? 0 : newCompleteRecipe.Ca + productInfo.Ca * product.weight rescue newCompleteRecipe.Ca
            newCompleteRecipe.Fe = newCompleteRecipe.Fe.nil? ? 0 : newCompleteRecipe.Fe + productInfo.Fe * product.weight rescue newCompleteRecipe.Fe
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
    def findAmount(recipe)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        amount = newCompleteRecipe.WhatIsLeft
        return amount
    end
    def calculateWhatsLeft(recipe,eaten)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        newCompleteRecipe.WhatIsLeft-=eaten
        if newCompleteRecipe.WhatIsLeft <= 0
            newCompleteRecipe.IsActive = false
        newCompleteRecipe.save
        end
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