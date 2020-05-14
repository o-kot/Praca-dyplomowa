class MealsPg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def getEaten(date)
        newEaten = EatenDbModel.where(IDU:@userID,date:date)
    end
    def getMeals
        meals = MealDbModel.all
        return meals
    end
    def getEaten(date)
        mealsList = EatenDbModel.where(IDU:@userID,Date:date)
        mealsList.each do |meal|
            meal.name = meal.CustomProductName.present? ? meal.CustomProductName : ProductInfoDbModel.where(id:meal.IDPR).first.Name
        end
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
        return 'success'
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
        newMealTMP.Omega3 = omega3 rescue nil
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
    def findLast
        last = EatenDbModel.where("IDU = ? and CustomProductName is not null",@userID).last
        return last
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
        end
        newMealTMP.Calories = 0
        newMealTMP.Protein = 0
        newMealTMP.Carbs = 0
        newMealTMP.Fat = 0
        newMealTMP.save
        return newMealTMP.id
    end
    def calculateMealRequisition(meal)
        calculating = EatenDbModel.where(id:meal).first
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
        calculating.Sugars = completeRecipe.Sugars * quantity rescue nil
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
        gotten = EatenDbModel.new
        gotten.Protein = 0
        gotten.Carbs = 0
        gotten.Fat = 0
        gotten.Sugars = 0
        gotten.Fiber = 0
        gotten.Omega3 = 0
        gotten.ALA = 0
        gotten.SFA = 0
        gotten.WNKT = 0
        gotten.Trans = 0
        gotten.Cholesterol = 0
        gotten.Valine = 0
        gotten.Isoleucine = 0
        gotten.Leucine = 0
        gotten.Lysine = 0
        gotten.Methionine = 0
        gotten.Threonine = 0
        gotten.Tryptophan = 0
        gotten.Phenylalanine = 0
        gotten.VitA = 0
        gotten.VitB1 = 0
        gotten.VitB2 = 0
        gotten.VitB3 = 0
        gotten.VitB4 = 0
        gotten.VitB5 = 0
        gotten.VitB6 = 0
        gotten.VitB9 = 0
        gotten.VitB12 = 0
        gotten.VitC = 0
        gotten.VitD = 0
        gotten.VitE = 0
        gotten.VitH = 0
        gotten.VitK = 0
        gotten.Cl = 0
        gotten.Zn = 0
        gotten.F = 0
        gotten.P = 0
        gotten.I = 0
        gotten.Mg = 0
        gotten.Cu = 0
        gotten.K = 0
        gotten.Se = 0
        gotten.Na = 0
        gotten.Ca = 0
        gotten.Fe = 0
        eaten = EatenDbModel.where(Date:date)
        eaten.each do |e|
            gotten.Protein += e.Protein rescue gotten.Protein
            gotten.Carbs += e.Carbs rescue gotten.Carbs
            gotten.Fat += e.Fat rescue gotten.Fat
            gotten.Sugars += e.Sugars rescue gotten.Sugars
            gotten.Fiber += e.Fiber rescue gotten.Fiber
            gotten.Omega3 += e.Omega3 rescue gotten.Omega3
            gotten.ALA += e.ALA rescue gotten.ALA
            gotten.SFA += e.SFA rescue gotten.SFA
            gotten.WNKT += e.WNKT rescue gotten.WNKT
            gotten.Trans += e.Trans rescue gotten.Trans
            gotten.Cholesterol += e.Cholesterol rescue gotten.Cholesterol
            gotten.Valine += e.Valine rescue gotten.Valine
            gotten.Isoleucine += e.Isoleucine rescue gotten.Isoleucine
            gotten.Leucine += e.Leucine rescue gotten.Leucine
            gotten.Lysine += e.Lysine rescue gotten.Lysine
            gotten.Methionine += e.Methionine rescue gotten.Methionine
            gotten.Threonine += e.Threonine rescue gotten.Threonine
            gotten.Tryptophan += e.Tryptophan rescue gotten.Tryptophan
            gotten.Phenylalanine += e.Phenylalanine rescue gotten.Phenylalanine
            gotten.VitA += e.VitA rescue gotten.VitA
            gotten.VitB1 += e.VitB1 rescue gotten.VitB1
            gotten.VitB2 += e.VitB2 rescue gotten.VitB2
            gotten.VitB3 += e.VitB3 rescue gotten.VitB3
            gotten.VitB4 += e.VitB4 rescue gotten.VitB4
            gotten.VitB5 += e.VitB5 rescue gotten.VitB5
            gotten.VitB6 += e.VitB6 rescue gotten.VitB6
            gotten.VitB9 += e.VitB9 rescue gotten.VitB9
            gotten.VitB12 += e.VitB12 rescue gotten.VitB12
            gotten.VitC += e.VitC rescue gotten.VitC
            gotten.VitD += e.VitB6 rescue gotten.VitD
            gotten.VitE += e.VitE rescue gotten.VitE
            gotten.VitH += e.VitH rescue gotten.VitH
            gotten.VitK += e.VitK rescue gotten.VitK
            gotten.Cl += e.Cl rescue gotten.Cl
            gotten.Zn += e.Zn rescue gotten.Zn
            gotten.F += e.F rescue gotten.F
            gotten.P += e.P rescue gotten.P
            gotten.I += e.I rescue gotten.I
            gotten.Mg += e.Mg rescue gotten.Mg
            gotten.Cu += e.Cu rescue gotten.Cu
            gotten.K += e.K rescue gotten.K
            gotten.Se += e.Se rescue gotten.Se
            gotten.Na += e.Na rescue gotten.Na
            gotten.Ca += e.Ca rescue gotten.Ca
            gotten.Fe += e.Fe rescue gotten.Fe
        end
        return gotten
    end
    def decompose(customProduct,product,weight)
        eaten = EatenDbModel.where(id:customProduct).first
        eatenTMP = EatenDbModel.new
        eatenTMP.Calories = 0
        eatenTMP.Protein = 0
        eatenTMP.Carbs = 0
        eatenTMP.Fat = 0
        eatenTMP.Sugars = 0
        eatenTMP.Fiber = 0
        eatenTMP.Omega3 = 0
        eatenTMP.ALA = 0
        eatenTMP.SFA = 0
        eatenTMP.WNKT = 0
        eatenTMP.Trans = 0
        eatenTMP.Cholesterol = 0
        eatenTMP.Valine = 0
        eatenTMP.Isoleucine = 0
        eatenTMP.Leucine = 0
        eatenTMP.Lysine = 0
        eatenTMP.Methionine = 0
        eatenTMP.Threonine = 0
        eatenTMP.Tryptophan = 0
        eatenTMP.Phenylalanine = 0
        eatenTMP.VitA = 0
        eatenTMP.VitB1 = 0
        eatenTMP.VitB2 = 0
        eatenTMP.VitB3 = 0
        eatenTMP.VitB4 = 0
        eatenTMP.VitB5 = 0
        eatenTMP.VitB6 = 0
        eatenTMP.VitB9 = 0
        eatenTMP.VitB12 = 0
        eatenTMP.VitC = 0
        eatenTMP.VitD = 0
        eatenTMP.VitE = 0
        eatenTMP.VitH = 0
        eatenTMP.VitK = 0
        eatenTMP.Cl = 0
        eatenTMP.Zn = 0
        eatenTMP.F = 0
        eatenTMP.P = 0
        eatenTMP.I = 0
        eatenTMP.Mg = 0
        eatenTMP.Cu = 0
        eatenTMP.K = 0
        eatenTMP.Se = 0
        eatenTMP.Na = 0
        eatenTMP.Ca = 0
        eatenTMP.Fe = 0
        product.each_with_index do |p,index|
            productInfo = ProductInfoDbModel.find(p)
            eatenTMP.Calories += p.Calories * weight[index] rescue eatenTMP.Calories
            eatenTMP.Protein += p.Protein * weight[index] rescue eatenTMP.Protein
            eatenTMP.Carbs += p.Carb * weight[index] rescue eatenTMP.Carbs
            eatenTMP.Fat += p.Fat * weight[index] rescue eatenTMP.Fat
            eatenTMP.Sugars += p.Sugars * weight[index] rescue eatenTMP.Sugars
            eatenTMP.Fiber += p.Fiber * weight[index] rescue eatenTMP.Fiber
            eatenTMP.Omega3 += p.Omega3 * weight[index] rescue eatenTMP.Omega3
            eatenTMP.ALA += p.ALA * weight[index] rescue eatenTMP.ALA
            eatenTMP.SFA += p.SFA * weight[index] rescue eatenTMP.SFA
            eatenTMP.WNKT += p.WNKT * weight[index] rescue eatenTMP.WNKT
            eatenTMP.Trans += p.Trans * weight[index] rescue eatenTMP.Trans
            eatenTMP.Cholesterol += p.Cholesterol * weight[index] rescue eatenTMP.Cholesterol
            eatenTMP.Valine += p.Valine * weight[index] rescue eatenTMP.Valine
            eatenTMP.Isoleucine += p.Isoleucine * weight[index] rescue eatenTMP.Isoleucine
            eatenTMP.Leucine += p.Leucine * weight[index] rescue eatenTMP.Leucine
            eatenTMP.Lysine += p.Lysine * weight[index] rescue eatenTMP.Lysine
            eatenTMP.Methionine += p.Methionine * weight[index] rescue eatenTMP.Methionine
            eatenTMP.Threonine += p.Threonine * weight[index] rescue eatenTMP.Threonine
            eatenTMP.Tryptophan += p.Tryptophan * weight[index] rescue eatenTMP.Tryptophan
            eatenTMP.Phenylalanine += p.Phenylalanine * weight[index] rescue eatenTMP.Phenylalanine
            eatenTMP.VitA += p.VitA * weight[index] rescue eatenTMP.VitA
            eatenTMP.VitB1 += p.VitB1 * weight[index] rescue eatenTMP.VitB1
            eatenTMP.VitB2 += p.VitB2 * weight[index] rescue eatenTMP.VitB2
            eatenTMP.VitB3 += p.VitB3 * weight[index] rescue eatenTMP.VitB3
            eatenTMP.VitB4 += p.VitB4 * weight[index] rescue eatenTMP.VitB4
            eatenTMP.VitB5 += p.VitB5 * weight[index] rescue eatenTMP.VitB5
            eatenTMP.VitB6 += p.VitB6 * weight[index] rescue eatenTMP.VitB6
            eatenTMP.VitB9 += p.VitB9 * weight[index] rescue eatenTMP.VitB9
            eatenTMP.VitB12 += p.VitB12 * weight[index] rescue eatenTMP.VitB12
            eatenTMP.VitC += p.VitC * weight[index] rescue eatenTMP.VitC
            eatenTMP.VitD += p.VitD * weight[index] rescue eatenTMP.VitD
            eatenTMP.VitE += p.VitE * weight[index] rescue eatenTMP.VitE
            eatenTMP.VitH += p.VitH * weight[index] rescue eatenTMP.VitH
            eatenTMP.VitK += p.VitK * weight[index] rescue eatenTMP.VitK
            eatenTMP.Cl += p.Cl * weight[index] rescue eatenTMP.Cl
            eatenTMP.Zn += p.Zn * weight[index] rescue eatenTMP.Zn
            eatenTMP.F += p.F * weight[index] rescue eatenTMP.F
            eatenTMP.P += p.P * weight[index] rescue eatenTMP.P
            eatenTMP.I += p.I * weight[index] rescue eatenTMP.I
            eatenTMP.Mg += p.Mg * weight[index] rescue eatenTMP.Mg
            eatenTMP.Cu += p.Cu * weight[index] rescue eatenTMP.Cu
            eatenTMP.K += p.K * weight[index] rescue eatenTMP.K
            eatenTMP.Se += p.Se * weight[index] rescue eatenTMP.Se
            eatenTMP.Na += p.Na * weight[index] rescue eatenTMP.Na
            eatenTMP.Ca += p.Ca * weight[index] rescue eatenTMP.Ca
        end
        eaten.Protein = eatenTMP.Protein if eaten.Protein.blank? && eatenTMP.Protein != 0
        eaten.Carbs = eatenTMP.Carbs if eaten.Carbs.blank? && eatenTMP.Carbs  != 0
        eaten.Fat = eatenTMP.Fat if eaten.Fat.blank? && eatenTMP.Fat != 0
        eaten.Sugars = eatenTMP.Sugars if eaten.Sugars.blank? && eatenTMP.Sugars != 0
        eaten.Fiber = eatenTMP.Fiber if eaten.Fiber.blank? && eatenTMP.Fiber != 0
        eaten.Omega3 = eatenTMP.Omega3 if eaten.Omega3.blank? && eatenTMP.Omega3 != 0
        eaten.ALA = eatenTMP.ALA if eaten.ALA.blank? && eatenTMP.ALA != 0
        eaten.SFA = eatenTMP.SFA if eaten.SFA.blank? && eatenTMP.SFA != 0
        eaten.WNKT = eatenTMP.WNKT if eaten.WNKT.blank? && eatenTMP.WNKT != 0
        eaten.Trans = eatenTMP.Trans if eaten.Trans.blank? && eatenTMP.Trans != 0
        eaten.Cholesterol = eatenTMP.Cholesterol if eaten.Cholesterol.blank? && eatenTMP.Cholesterol != 0
        eaten.Valine = eatenTMP.Valine if eaten.Valine.blank? && eatenTMP.Valine != 0
        eaten.Isoleucine = eatenTMP.Isoleucine if eaten.Isoleucine.blank? && eatenTMP.Isoleucine != 0
        eaten.Leucine = eatenTMP.Leucine if eaten.Leucine.blank? && eatenTMP.Leucine != 0
        eaten.Lysine = eatenTMP.Lysine if eaten.Lysine.blank? && eatenTMP.Lysine != 0
        eaten.Methionine = eatenTMP.Methionine if eaten.Methionine.blank? && eatenTMP.Methionine != 0
        eaten.Threonine = eatenTMP.Threonine if eaten.Threonine.blank? && eatenTMP.Threonine != 0
        eaten.Tryptophan = eatenTMP.Tryptophan if eaten.Tryptophan.blank? && eatenTMP.Tryptophan != 0
        eaten.Phenylalanine = eatenTMP.Phenylalanine if eaten.Phenylalanine.blank? && eatenTMP.Phenylalanine != 0
        eaten.VitA = eatenTMP.VitA if eaten.VitA.blank? && eatenTMP.VitA != 0
        eaten.VitB1 = eatenTMP.VitB1 if eaten.VitB1.blank? && eatenTMP.VitB1 != 0
        eaten.VitB2 = eatenTMP.VitB2 if eaten.VitB2.blank? && eatenTMP.VitB2 != 0
        eaten.VitB3 = eatenTMP.VitB3 if eaten.VitB3.blank? && eatenTMP.VitB3 != 0
        eaten.VitB4 = eatenTMP.VitB4 if eaten.VitB4.blank? && eatenTMP.VitB4 != 0
        eaten.VitB5 = eatenTMP.VitB5 if eaten.VitB5.blank? && eatenTMP.VitB5 != 0
        eaten.VitB6 = eatenTMP.VitB6 if eaten.VitB6.blank? && eatenTMP.VitB6 != 0
        eaten.VitB9 = eatenTMP.VitB9 if eaten.VitB9.blank? && eatenTMP.VitB9 != 0
        eaten.VitB12 = eatenTMP.VitB12 if eaten.VitB12.blank? && eatenTMP.VitB12 != 0
        eaten.VitC = eatenTMP.VitC if eaten.VitC.blank? && eatenTMP.VitC != 0
        eaten.VitD = eatenTMP.VitD if eaten.VitD.blank? && eatenTMP.VitD != 0
        eaten.VitE = eatenTMP.VitE if eaten.VitE.blank? && eatenTMP.VitE != 0
        eaten.VitH = eatenTMP.VitH if eaten.VitH.blank? && eatenTMP.VitH != 0
        eaten.VitK = eatenTMP.VitK if eaten.VitK.blank? && eatenTMP.VitK != 0
        eaten.Cl = eatenTMP.Cl if eaten.Cl.blank? && eatenTMP.Cl != 0
        eaten.Zn = eatenTMP.Zn if eaten.Zn.blank? && eatenTMP.Zn !=0
        eaten.F = eatenTMP.F if eaten.F.blank? && eatenTMP.F != 0
        eaten.P = eatenTMP.P if eaten.P.blank? && eatenTMP.P != 0
        eaten.I = eatenTMP.I if eaten.I.blank? && eatenTMP.I != 0
        eaten.Mg = eatenTMP.Mg if eaten.Mg.blank? && eatenTMP.Mg != 0
        eaten.Cu = eatenTMP.Cu if eaten.Cu.blank? && eatenTMP.Cu != 0
        eaten.K = eatenTMP.K if eaten.K.blank? && eatenTMP.K != 0
        eaten.Se = eatenTMP.Se if eaten.Se.blank? && eatenTMP.Se !=0
        eaten.Na = eatenTMP.Na if eaten.Na.blank? && eatenTMP.Na != 0
        eaten.Ca = eatenTMP.Ca if eaten.Ca.blank? && eatenTMP.Ca != 0
        eaten.Fe = eatenTMP.Fe if eaten.Fe.blank? && eatenTMP.Fe != 0
        eaten.save
        return "success"
    end
end