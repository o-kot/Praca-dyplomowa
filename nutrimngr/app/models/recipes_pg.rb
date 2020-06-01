class RecipesPg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def set(id,name)
        recipe = RecipeDbModel.new
        recipe.id = id
        recipe.Name = name
        return recipe
    end
    def getRecipeList
        recipes = RecipeDbModel.where(IDU:@userID,IsActive:true)
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
            editing = RecipeDbModel.find(recipe)
            editing.update_attributes(Name:name)
            return 'success'
        end
    end
    def deleteRecipe(id)
        if CompleteRecipeDbModel.where(IDR:id,IsActive:true).exists?
            return 'Nie można usunąć przepisu dopóki istnieją niespożyte potrawy z niego zrobione.' 
        end
        recipe = RecipeDbModel.where(id:id).first
        recipe.update_attributes(IsActive:false)
        return 'success'
    end
    def find(recipe)
        searched = RecipeDbModel.where(id:recipe).first
    end
    def findLast
        last = RecipeDbModel.where(IDU:@userID).last
        return last
    end
    def findLastComplete
        last = CompleteRecipeDbModel.find_by_sql(['SELECT cr.* FROM "CompleteRecipe" cr JOIN "Recipe" r ON r.id = cr."IDR" WHERE "IDU" = ? ORDER BY cr.id DESC LIMIT 1',@userID]).first
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
        newRecipeProduct = RecipeProductsDbModel.where(IDR:recipe,IDP:product).first
        newRecipeProduct.update_attributes(Weight:weight)        
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
            ingredients[product[:id]]=ProductInfoDbModel.where(id:product[:id]).first.Name
            ingredientsWeight[product[:id]]=product[:weight]

        end
        return {ingredients:ingredients,ingredientsWeight:ingredientsWeight}
    end
    def createCompleteRecipe(recipe)
        tmp = RecipeProductsDbModel.where(IDR:recipe)
        tmpWeight = 0
        tmp.each do |t|
            tmpWeight += (t.Weight.nil? ? 0 : t.Weight)
        end
        if tmpWeight == 0
            return 'NoWeight'
        end
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
            productInfo = ProductInfoDbModel.where(id:product[:id]).first
            newCompleteRecipe.Calories = (newCompleteRecipe.Calories.nil? ? 0 : newCompleteRecipe.Calories) + productInfo.Calories * product[:weight]/100 rescue newCompleteRecipe.Calories
            newCompleteRecipe.Protein = (newCompleteRecipe.Protein.nil? ? 0 : newCompleteRecipe.Protein) + productInfo.Protein * product[:weight]/100 rescue newCompleteRecipe.Protein
            newCompleteRecipe.Carbs = (newCompleteRecipe.Carbs.nil? ? 0 : newCompleteRecipe.Carbs) + productInfo.Carbs * product[:weight]/100 rescue newCompleteRecipe.Carbs
            newCompleteRecipe.Fat = (newCompleteRecipe.Fat.nil? ? 0 : newCompleteRecipe.Fat) + productInfo.Fat * product[:weight]/100 rescue newCompleteRecipe.Fat
            newCompleteRecipe.Sugars = (newCompleteRecipe.Sugars.nil? ? 0 : newCompleteRecipe.Sugars) + productInfo.Sugars * product[:weight]/100 rescue newCompleteRecipe.Sugars
            newCompleteRecipe.Fiber = (newCompleteRecipe.Fiber.nil? ? 0 : newCompleteRecipe.Fiber ) + productInfo.Fiber * product[:weight]/100 rescue newCompleteRecipe.Fiber
            newCompleteRecipe.Omega3 = (newCompleteRecipe.Omega3.nil? ? 0 : newCompleteRecipe.Omega3) + productInfo.Omega3 * product[:weight]/100 rescue newCompleteRecipe.Omega3
            newCompleteRecipe.ALA = (newCompleteRecipe.ALA.nil? ? 0 : newCompleteRecipe.ALA) + productInfo.ALA * product[:weight]/100 rescue newCompleteRecipe.ALA
            newCompleteRecipe.SFA = (newCompleteRecipe.SFA.nil? ? 0 : newCompleteRecipe.SFA) + productInfo.SFA * product[:weight]/100 rescue newCompleteRecipe.SFA
            newCompleteRecipe.WNKT = (newCompleteRecipe.WNKT.nil? ? 0 : newCompleteRecipe.WNKT) + productInfo.WNKT * product[:weight]/100 rescue newCompleteRecipe.WNKT
            newCompleteRecipe.Trans = (newCompleteRecipe.Trans.nil? ? 0 : newCompleteRecipe.Trans) + productInfo.Trans * product[:weight]/100 rescue newCompleteRecipe.Trans
            newCompleteRecipe.Cholesterol = (newCompleteRecipe.Cholesterol.nil? ? 0 : newCompleteRecipe.Cholesterol) + productInfo.Cholesterol * product[:weight]/100 rescue newCompleteRecipe.Cholesterol
            newCompleteRecipe.Valine = (newCompleteRecipe.Valine.nil? ? 0 : newCompleteRecipe.Valine) + productInfo.Valine * product[:weight]/100 rescue newCompleteRecipe.Valine
            newCompleteRecipe.Isoleucine = (newCompleteRecipe.Isoleucine.nil? ? 0 : newCompleteRecipe.Isoleucine) + productInfo.Isoleucine * product[:weight]/100 rescue newCompleteRecipe.Isoleucine
            newCompleteRecipe.Leucine = (newCompleteRecipe.Leucine.nil? ? 0 : newCompleteRecipe.Leucine) + productInfo.Leucine * product[:weight]/100 rescue newCompleteRecipe.Leucine
            newCompleteRecipe.Lysine = (newCompleteRecipe.Lysine.nil? ? 0 : newCompleteRecipe.Lysine) + productInfo.Lysine * product[:weight]/100 rescue newCompleteRecipe.Lysine
            newCompleteRecipe.Methionine = (newCompleteRecipe.Methionine.nil? ? 0 : newCompleteRecipe.Methionine) + productInfo.Methionine * product[:weight]/100 rescue newCompleteRecipe.Methionine
            newCompleteRecipe.Threonine = (newCompleteRecipe.Threonine.nil? ? 0 : newCompleteRecipe.Threonine) + productInfo.Threonine * product[:weight]/100 rescue newCompleteRecipe.Threonine
            newCompleteRecipe.Tryptophan = (newCompleteRecipe.Tryptophan.nil? ? 0 : newCompleteRecipe.Tryptophan) + productInfo.Tryptophan * product[:weight]/100 rescue newCompleteRecipe.Tryptophan
            newCompleteRecipe.Phenylalanine = (newCompleteRecipe.Phenylalanine.nil? ? 0 : newCompleteRecipe.Phenylalanine) + productInfo.Phenylalanine * product[:weight]/100 rescue newCompleteRecipe.Phenylalanine
            newCompleteRecipe.VitA = (newCompleteRecipe.VitA.nil? ? 0 : newCompleteRecipe.VitA) + productInfo.VitA * product[:weight]/100 rescue newCompleteRecipe.VitA
            newCompleteRecipe.VitB1 = (newCompleteRecipe.VitB1.nil? ? 0 : newCompleteRecipe.VitB1) + productInfo.VitB1 * product[:weight]/100 rescue newCompleteRecipe.VitB1
            newCompleteRecipe.VitB2 = (newCompleteRecipe.VitB2.nil? ? 0 : newCompleteRecipe.VitB2) + productInfo.VitB2 * product[:weight]/100 rescue newCompleteRecipe.VitB2
            newCompleteRecipe.VitB3 = (newCompleteRecipe.VitB3.nil? ? 0 : newCompleteRecipe.VitB3) + productInfo.VitB3 * product[:weight]/100 rescue newCompleteRecipe.VitB3
            newCompleteRecipe.VitB4 = (newCompleteRecipe.VitB4.nil? ? 0 : newCompleteRecipe.VitB4) + productInfo.VitB4 * product[:weight]/100 rescue newCompleteRecipe.VitB4
            newCompleteRecipe.VitB5 = (newCompleteRecipe.VitB5.nil? ? 0 : newCompleteRecipe.VitB5) + productInfo.VitB5 * product[:weight]/100 rescue newCompleteRecipe.VitB5
            newCompleteRecipe.VitB6 = (newCompleteRecipe.VitB6.nil? ? 0 : newCompleteRecipe.VitB6) + productInfo.VitB6 * product[:weight]/100 rescue newCompleteRecipe.VitB6
            newCompleteRecipe.VitB9 = (newCompleteRecipe.VitB9.nil? ? 0 : newCompleteRecipe.VitB9) + productInfo.VitB9 * product[:weight]/100 rescue newCompleteRecipe.VitB9
            newCompleteRecipe.VitB12 = (newCompleteRecipe.VitB12.nil? ? 0 : newCompleteRecipe.VitB12) + productInfo.VitB12 * product[:weight]/100 rescue newCompleteRecipe.VitB12
            newCompleteRecipe.VitC = (newCompleteRecipe.VitC.nil? ? 0 : newCompleteRecipe.VitC) + productInfo.VitC * product[:weight]/100 rescue newCompleteRecipe.VitC
            newCompleteRecipe.VitD = (newCompleteRecipe.VitD.nil? ? 0 : newCompleteRecipe.VitD) + productInfo.VitD * product[:weight]/100 rescue newCompleteRecipe.VitD
            newCompleteRecipe.VitE = (newCompleteRecipe.VitE.nil? ? 0 : newCompleteRecipe.VitE) + productInfo.VitE * product[:weight]/100 rescue newCompleteRecipe.VitE
            newCompleteRecipe.VitH = (newCompleteRecipe.VitH.nil? ? 0 : newCompleteRecipe.VitH) + productInfo.VitH * product[:weight]/100 rescue newCompleteRecipe.VitH
            newCompleteRecipe.VitK = (newCompleteRecipe.VitK.nil? ? 0 : newCompleteRecipe.VitK) + productInfo.VitK * product[:weight]/100 rescue newCompleteRecipe.VitK
            newCompleteRecipe.Cl = (newCompleteRecipe.Cl.nil? ? 0 : newCompleteRecipe.Cl) + productInfo.Cl * product[:weight]/100 rescue newCompleteRecipe.Cl
            newCompleteRecipe.Zn = (newCompleteRecipe.Zn.nil? ? 0: newCompleteRecipe.Zn) + productInfo.Zn * product[:weight]/100 rescue newCompleteRecipe.Zn
            newCompleteRecipe.F = (newCompleteRecipe.F.nil? ? 0 : ewCompleteRecipe.F) + productInfo.F * product[:weight]/100 rescue newCompleteRecipe.F
            newCompleteRecipe.P = (newCompleteRecipe.P.nil? ? 0 : newCompleteRecipe.P) + productInfo.P * product[:weight]/100 rescue newCompleteRecipe.P
            newCompleteRecipe.I = (newCompleteRecipe.I.nil? ? 0 : newCompleteRecipe.I) + productInfo.I * product[:weight]/100 rescue newCompleteRecipe.I
            newCompleteRecipe.Mg = (ewCompleteRecipe.Mg.nil? ? 0 : ewCompleteRecipe.Mg) + productInfo.Mg * product[:weight]/100 rescue newCompleteRecipe.Mg
            newCompleteRecipe.Cu = (newCompleteRecipe.Cu.nil? ? 0 : newCompleteRecipe.Cu) + productInfo.Cu * product[:weight]/100 rescue newCompleteRecipe.Cu
            newCompleteRecipe.K = (newCompleteRecipe.K.nil? ? 0 : newCompleteRecipe.K) + productInfo.K * product[:weight]/100 rescue newCompleteRecipe.K
            newCompleteRecipe.Se = (newCompleteRecipe.Se.nil? ? 0 : newCompleteRecipe.Se) + productInfo.Se * product[:weight]/100 rescue newCompleteRecipe.Se
            newCompleteRecipe.Na = (newCompleteRecipe.Na.nil? ? 0 : newCompleteRecipe.Na) + productInfo.Na  * product[:weight]/100 rescue newCompleteRecipe.Na
            newCompleteRecipe.Ca = (newCompleteRecipe.Ca.nil? ? 0 : newCompleteRecipe.Ca) + productInfo.Ca * product[:weight]/100 rescue newCompleteRecipe.Ca
            newCompleteRecipe.Fe = (newCompleteRecipe.Fe.nil? ? 0 : newCompleteRecipe.Fe) + productInfo.Fe * product[:weight]/100 rescue newCompleteRecipe.Fe
        end
        newCompleteRecipe.save
        return 'success'
    end
    def measureRecipe(recipe,how,measurement)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        if how == 'weight'
            newCompleteRecipe.IsWeighted = true
            newCompleteRecipe.Weight = measurement
            newCompleteRecipe.WhatIsLeft = measurement
            newCompleteRecipe.save
        elsif how == 'portions'
            newCompleteRecipe.update_attributes(HasPortions:true)
            newCompleteRecipe.HasPortions = true
            newCompleteRecipe.HowManyPortions = measurement
            newCompleteRecipe.WhatIsLeft = measurement
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
        newCompleteRecipe.update_attributes(WhatIsLeft:newCompleteRecipe.WhatIsLeft)
        if newCompleteRecipe.WhatIsLeft <= 0
            newCompleteRecipe.update_attributes(IsActive:false)
        end
    end
    def getCompleteRecipeList
        recipes = RecipeDbModel.where(IDU:@userID).map{|r| r.id}
        completeRecipes = CompleteRecipeDbModel.where(IDR:recipes,IsActive:true)
    end
    def markAsEaten(recipe)
        newCompleteRecipe = CompleteRecipeDbModel.where(id:recipe).first
        newCompleteRecipe.update_attributes(IsActive:false )
        return 'success'
    end
end