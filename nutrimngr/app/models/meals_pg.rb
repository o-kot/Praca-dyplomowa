class MealsPg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def getMeal
        newMeal = EatenDbModel.where(IDU:@userID).first    
    end
    def getMeals
        meals = MealsDbModel.all
        return meals
    end
    def getEaten(date)
        mealsList = EatenDbModel.where(IDU:@userID,date:date)
        return mealsList
    end
    def addMeal(date,time,meal)
        newMealTMP = EatenDbModel.new  
        newMealTMP.IDU = @userID
        newMealTMP.IDP = meal
        newMealTMP.Date = date
        newMealTMP.Time = time
        return newMealTMP
    end
    def editMeal(id) 
        newMeal = EatenDbModel.where(id:id).first   
    end
    def deleteMeal(id) 
        newMeal = EatenDbModel.where(id:id).first   
        newMeal.delete
        return "success"
    end
    def addProduct(meal,product,weight)
        newMealTMP = EatenDbModel.new
        eatenProduct = ProductInfoDbModel.where(id:product).first
        newMealTMP.IDU = @userID
        newMealTMP.IDP = meal.IDP
        newMealTMP.Date = meal.Date
        newMealTMP.Time = meal.Time
        newMealTMP.IDPR = product
        newMealTMP.Weight = weight
        newMealTMP.Calories = eatenProduct.Calories * weight
        newMealTMP.Protein = eatenProduct.Protein * weight
        newMealTMP.Carbs = eatenProduct.Carbs * weight
        newMealTMP.Fat = eatenProduct.Fat * weight
        newMealTMP.Sugars = eatenProduct.Sugars * weight rescue nil
        newMealTMP.Fiber = eatenProduct.Fiber * weight rescue nil
        newMealTMP.Omega3 = eatenProduct.Omega3 * weight rescue nil
        newMealTMP.ALA = eatenProduct.ALA * weight rescue nil
        newMealTMP.SFA = eatenProduct.SFA * weight rescue nil
        newMealTMP.WNKT = eatenProduct.WNKT * weight rescue nil
        newMealTMP.Trans = eatenProduct.Trans * weight rescue nil
        newMealTMP.Cholesterol = eatenProduct.Cholesterol * weight rescue nil
        newMealTMP.Valine = eatenProduct.Valine * weight rescue nil
        newMealTMP.Isoleucine = eatenProduct.Isoleucine * weight rescue nil
        newMealTMP.Leucine = eatenProduct.Leucine * weight rescue nil
        newMealTMP.Lysine = eatenProduct.Lysine * weight rescue nil
        newMealTMP.Methionine = eatenProduct.Methionine * weight rescue nil
        newMealTMP.Threonine = eatenProduct.Threonine * weight rescue nil
        newMealTMP.Tryptophan = eatenProduct.Tryptophan * weight rescue nil
        newMealTMP.Phenylalanine = eatenProduct.Phenylalanine * weight rescue nil
        newMealTMP.VitA = eatenProduct.VitA * weight rescue nil
        newMealTMP.VitB1 = eatenProduct.VitB1 * weight rescue nil
        newMealTMP.VitB2 = eatenProduct.VitB2 * weight rescue nil
        newMealTMP.VitB3 = eatenProduct.VitB3 * weight rescue nil
        newMealTMP.VitB4 = eatenProduct.VitB4 * weight rescue nil
        newMealTMP.VitB5 = eatenProduct.VitB5 * weight rescue nil
        newMealTMP.VitB6 = eatenProduct.VitB6 * weight rescue nil
        newMealTMP.VitB9 = eatenProduct.VitB9 * weight rescue nil
        newMealTMP.VitB12 = eatenProduct.VitB12 * weight rescue nil
        newMealTMP.VitC = eatenProduct.VitC * weight rescue nil
        newMealTMP.VitD = eatenProduct.VitD * weight rescue nil
        newMealTMP.VitE = eatenProduct.VitE * weight rescue nil
        newMealTMP.VitH = eatenProduct.VitH * weight rescue nil
        newMealTMP.VitK = eatenProduct.VitK * weight rescue nil
        newMealTMP.Cl = eatenProduct.Cl * weight rescue nil
        newMealTMP.Zn = eatenProduct.Zn * weight rescue nil
        newMealTMP.F = eatenProduct.F * weight rescue nil
        newMealTMP.P = eatenProduct.P * weight rescue nil
        newMealTMP.I = eatenProduct.I * weight rescue nil
        newMealTMP.Mg = eatenProduct.Mg * weight rescue nil
        newMealTMP.Cu = eatenProduct.Cu * weight rescue nil
        newMealTMP.K = eatenProduct.K * weight rescue nil
        newMealTMP.Se = eatenProduct.Se * weight rescue nil
        newMealTMP.Na = eatenProduct.Na * weight rescue nil
        newMealTMP.Ca = eatenProduct.Ca * weight rescue nil
        newMealTMP.Fe = eatenProduct.Fe * weight rescue nil
        newMealTMP.save
    end
    def addCustomProduct(meal,name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe,cholesterol,weight)
        newMealTMP = EatenDbModel.new  
        newMealTMP.IDU = @userID
        newMealTMP.IDP = meal.IDP
        newMealTMP.Date = meal.Date
        newMealTMP.Time = meal.Time
        newMealTMP.CustomProductName = name
        newMealTMP.Calories = calories rescue nil
        newMealTMP.Protein = protein rescue nil
        newMealTMP.Carbs = carbs rescue nil
        newMealTMP.Fat = fat rescue nil
        newMealTMP.Sugars = sugars rescue nil
        newMealTMP.Fiber = fiber rescue nil
        newMealTMP.Omega3 = omega3 * rescue nil
        newMealTMP.ALA = ala rescue nil
        newMealTMP.SFA = sfa rescue nil
        newMealTMP.WNKT = wnkt rescue nil
        newMealTMP.Trans = trans rescue nil
        newMealTMP.Cholesterol = cholesterol rescue nil
        newMealTMP.Valine = valine rescue nil
        newMealTMP.Isoleucine = isoleucine rescue nil
        newMealTMP.Leucine = leucine rescue nil
        newMealTMP.Lysine = lysine rescue nil
        newMealTMP.Methionine = methionine rescue nil
        newMealTMP.Threonine = threonine rescue nil
        newMealTMP.Tryptophan = tryptophan rescue nil
        newMealTMP.Phenylalanine = phenylalanine rescue nil
        newMealTMP.VitA = vitA rescue nil
        newMealTMP.VitB1 = vitB1 rescue nil
        newMealTMP.VitB2 = vitB2 rescue nil
        newMealTMP.VitB3 = vitB3 rescue nil
        newMealTMP.VitB4 = vitB4 rescue nil
        newMealTMP.VitB5 = vitB5 rescue nil
        newMealTMP.VitB6 = vitB6 rescue nil
        newMealTMP.VitB9 = vitB9 rescue nil
        newMealTMP.VitB12 = vitB12 rescue nil
        newMealTMP.VitC = vitC rescue nil
        newMealTMP.VitD = vitD rescue nil
        newMealTMP.VitE = vitE rescue nil
        newMealTMP.VitH = vitH rescue nil
        newMealTMP.VitK = vitK rescue nil
        newMealTMP.Cl = cl rescue nil
        newMealTMP.Zn = zn rescue nil
        newMealTMP.F = f rescue nil
        newMealTMP.P = p rescue nil
        newMealTMP.I = i rescue nil
        newMealTMP.Mg = mg rescue nil
        newMealTMP.Cu = cu rescue nil
        newMealTMP.K = k rescue nil
        newMealTMP.Se = se rescue nil
        newMealTMP.Na = na rescue nil
        newMealTMP.Ca = ca rescue nil
        newMealTMP.Fe = fe rescue nil  
        newMealTMP.save   
        return 'success'
    end
    def addCompleteRecipe(meal,recipe,portion)
        newMealTMP = EatenDbModel.new
        recipe = CompleteRecipeDbModel.where(id:recipe).first
        newMealTMP.IDU = @userID
        newMealTMP.IDP = meal.IDP
        newMealTMP.Date = meal.Date
        newMealTMP.Time = meal.Time
        newMealTMP.IDDR = recipe
        if recipe.HasPortion == true
            newMealTMP.Portions = portion
        elsif recipe.IsWeighted == true
            newMealTMP.Weight = portion
        newMealTMP.Calories = 0
        newMealTMP.Protein = 0
        newMealTMP.Carbs = 0
        newMealTMP.Fat = 0
        newMealTMP.save
        return newMealTMP.id
    end
    def calculateMealRequisition(meal)
        calculating = EatenDbModel.where(id:meal)
        completeRecipe = CompleteRecipeDbModel.where(id:calculating.IDDR).first
        quantity = 0
        if completeRecipe.HasPortion == true
            quantity = calculating.Portions
        elsif completeRecipe.IsWeighted == true
            quantity = calculating.Weight
        else "Error: data has an invalid value"
        end
        calculating.Calories = completeRecipe.Calories * quantity
        calculating.Protein = completeRecipe.Protein * quantity
        calculating.Carbs = completeRecipe.Carbs * quantity
        calculating.Fat = completeRecipe.Fat * quantity
        calculating.Sugars = completeRecipe.Sugars * quantity rescue nil rescue nil
        calculating.Fiber = completeRecipe.Fiber * quantity rescue nil
        calculating.Omega3 = completeRecipe.Omega3 * quantity rescue nil
        calculating.ALA = completeRecipe.ALA * quantity rescue nil
        calculating.SFA = completeRecipe.SFA * quantity rescue nil
        calculating.WNKT = completeRecipe.WNKT * quantity rescue nil
        calculating.Trans = completeRecipe.Trans * quantity rescue nil
        calculating.Cholesterol = completeRecipe.Cholesterol * quantity rescue nil
        calculating.Valine = completeRecipe.Valine * quantity rescue nil
        calculating.Isoleucine = completeRecipe.Isoleucine * quantity rescue nil
        calculating.Leucine = completeRecipe.Leucine * quantity rescue nil
        calculating.Lysine = completeRecipe.Lysine * quantity rescue nil
        calculating.Methionine = methionine * quantity rescue nil
        calculating.Threonine = completeRecipe.Threonine * quantity rescue nil
        calculating.Tryptophan = completeRecipe.Tryptophan * quantity rescue nil
        calculating.Phenylalanine = completeRecipe.Phenylalanine * quantity rescue nil
        calculating.VitA = completeRecipe.VitA * quantity rescue nil
        calculating.VitB1 = completeRecipe.VitB1 * quantity rescue nil
        calculating.VitB2 = completeRecipe.VitB2 * quantity rescue nil
        calculating.VitB3 = completeRecipe.VitB3 * quantity rescue nil
        calculating.VitB4 = completeRecipe.VitB4 * quantity rescue nil
        calculating.VitB5 = completeRecipe.VitB5 * quantity rescue nil
        calculating.VitB6 = completeRecipe.VitB6 * quantity rescue nil
        calculating.VitB9 = completeRecipe.VitB9 * quantity rescue nil
        calculating.VitB12 = completeRecipe.VitB12 * quantity rescue nil
        calculating.VitC = completeRecipe.VitC * quantity rescue nil
        calculating.VitD = completeRecipe.VitD * quantity rescue nil
        calculating.VitE = completeRecipe.VitE * quantity rescue nil
        calculating.VitH = completeRecipe.VitH * quantity rescue nil
        calculating.VitK = completeRecipe.VitK * quantity rescue nil
        calculating.Cl = completeRecipe.Cl * quantity rescue nil
        calculating.Zn = completeRecipe.Zn * quantity rescue nil
        calculating.F = completeRecipe.F * quantity rescue nil
        calculating.P = completeRecipe.P * quantity rescue nil
        calculating.I = completeRecipe.I * quantity rescue nil
        calculating.Mg = completeRecipe.Mg * quantity rescue nil
        calculating.Cu = completeRecipe.Cu * quantity rescue nil
        calculating.K = completeRecipe.K * quantity rescue nil
        calculating.Se = completeRecipe.Se * quantity rescue nil
        calculating.Na = completeRecipe.Na * quantity rescue nil
        calculating.Ca = completeRecipe.Ca * quantity rescue nil
        calculating.Fe = completeRecipe.Fe * quantity rescue nil
        calculating.save
        return "success"
    end
    def calculateDailyRequisition(date)
       
    end
    def decompose(customProduct,product,weight)
        eaten = EatenDbModel.where(id:customProduct)

        eatenTMP = EatenDbModel.where(id:customProduct)
        
        eaten.update_attributes( )
        return "success"
    end
end