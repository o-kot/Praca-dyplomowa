class ProductsPg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def getProductInfo(product)
        newProductInfo = ProductInfoDbModel.find(product)
    end
    def getProductList(userOnly)
        userOnly ? ProductInfoDbModel.where(IDU:@userID) : ProductInfoDbModel.where("\"IDU\" =? or \"IDU\" is NULL",@userID)
    end
    def addUserProduct(name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,cholesterol,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe,weight)
        if ProductInfoDbModel.where(Name:name).exists?
            return 'Produkt o takiej nazwie istnieje już w bazie danych'
        else
            newUserProduct = ProductInfoDbModel.new
            newUserProduct.Name = name
            newUserProduct.IDU = @userID
            if weight == 100
                newUserProduct.Calories = calories
                newUserProduct.Protein = protein
                newUserProduct.Carbs = carbs
                newUserProduct.Fat = fat
                newUserProduct.Sugars = sugars
                newUserProduct.Fiber = fiber
                newUserProduct.Omega3 = omega3
                newUserProduct.ALA = ala
                newUserProduct.SFA = sfa
                newUserProduct.WNKT = wnkt
                newUserProduct.Trans = trans
                newUserProduct.Cholesterol = cholesterol
                newUserProduct.Valine = valine
                newUserProduct.Isoleucine = isoleucine
                newUserProduct.Leucine = leucine
                newUserProduct.Lysine = lysine
                newUserProduct.Methionine = methionine
                newUserProduct.Threonine = threonine
                newUserProduct.Tryptophan = tryptophan
                newUserProduct.Phenylalanine = phenylalanine
                newUserProduct.VitA = vitA
                newUserProduct.VitB1 = vitB1
                newUserProduct.VitB2 = vitB2
                newUserProduct.VitB3 = vitB3
                newUserProduct.VitB4 = vitB4
                newUserProduct.VitB5 = vitB5
                newUserProduct.VitB6 = vitB6
                newUserProduct.VitB9 = vitB9
                newUserProduct.VitB12 = vitB12
                newUserProduct.VitC = vitC
                newUserProduct.VitD = vitD
                newUserProduct.VitE = vitE
                newUserProduct.VitH = vitH
                newUserProduct.VitK = vitK
                newUserProduct.Cl = cl
                newUserProduct.Zn = zn
                newUserProduct.F = f
                newUserProduct.P = p
                newUserProduct.I = i
                newUserProduct.Mg = mg
                newUserProduct.Cu = cu
                newUserProduct.K = k
                newUserProduct.Se = se
                newUserProduct.Na = na
                newUserProduct.Ca = ca
                newUserProduct.Fe = fe
            else
                temp = 100/weight
                newUserProduct.Calories = calories.to_f * temp
                newUserProduct.Protein = Pprotein.to_f * temp rescue nil
                newUserProduct.Carbs = carbs.to_f * temp rescue nil
                newUserProduct.Fat = fat.to_f * temp rescue nil
                newUserProduct.Sugars = sugars.to_f * temp rescue nil
                newUserProduct.Fiber = fiber.to_f * temp rescue nil
                newUserProduct.Omega3 = omega3.to_f * temp rescue nil
                newUserProduct.ALA = ala.to_f * temp rescue nil
                newUserProduct.SFA = sfa.to_f * temp rescue nil
                newUserProduct.WNKT = wnkt.to_f * temp rescue nil
                newUserProduct.Trans = trans.to_f * temp rescue nil
                newUserProduct.Cholesterol = cholesterol.to_f * temp rescue nil
                newUserProduct.Valine = valine.to_f * temp rescue nil
                newUserProduct.Isoleucine = isoleucine.to_f * temp rescue nil
                newUserProduct.Leucine = leucine.to_f * temp rescue nil
                newUserProduct.Lysine = lysine.to_f * temp rescue nil
                newUserProduct.Methionine = methionine.to_f * temp rescue nil
                newUserProduct.Threonine = threonine.to_f * temp rescue nil
                newUserProduct.Tryptophan = tryptophan.to_f * temp rescue nil
                newUserProduct.Phenylalanine = phenylalanine.to_f * temp rescue nil
                newUserProduct.VitA = vitA.to_f * temp rescue nil
                newUserProduct.VitB1 = vitB1.to_f * temp rescue nil
                newUserProduct.VitB2 = vitB2.to_f * temp rescue nil
                newUserProduct.VitB3 = vitB3.to_f * temp rescue nil
                newUserProduct.VitB4 = vitB4.to_f * temp rescue nil
                newUserProduct.VitB5 = vitB5.to_f * temp rescue nil
                newUserProduct.VitB6 = vitB6.to_f * temp rescue nil
                newUserProduct.VitB9 = vitB9.to_f * temp rescue nil
                newUserProduct.VitB12 = vitB12.to_f * temp rescue nil
                newUserProduct.VitC = vitC.to_f * temp rescue nil
                newUserProduct.VitD = vitD.to_f * temp rescue nil
                newUserProduct.VitE = vitE.to_f * temp rescue nil
                newUserProduct.VitH = vitH.to_f * temp rescue nil
                newUserProduct.VitK = vitK.to_f * temp rescue nil
                newUserProduct.Cl = cl.to_f * temp rescue nil
                newUserProduct.Zn = zn.to_f * temp rescue nil
                newUserProduct.F = f.to_f * temp rescue nil
                newUserProduct.P = p.to_f * temp rescue nil
                newUserProduct.I = i.to_f * temp rescue nil
                newUserProduct.Mg = mg.to_f * temp rescue nil
                newUserProduct.Cu = cu.to_f * temp rescue nil
                newUserProduct.K = k.to_f * temp rescue nil
                newUserProduct.Se = se.to_f * temp rescue nil
                newUserProduct.Na = na.to_f  * temp rescue nil
                newUserProduct.Ca = ca.to_f * temp rescue nil
                newUserProduct.Fe = fe.to_f * temp rescue nil
            end
        newUserProduct.save
        end
        return 'success'
    end
    def editProductInfo(product,edited)
        if ProductInfoDbModel.where(Name:edited['Name']).exists?
            return 'Produkt o takiej nazwie istnieje już w bazie danych.'
        end
        product = ProductInfoDbModel.find(product)
        product.Name = edited['Name'] if edited.key?('Name')
        if edited['weight'] == 100
            edited.each do |key,value|
                next if %w[weight authenticity_token Name product defaultWeight controller action].include?(key)
                product.update_attributes(key => value)
            end
        else
            temp = 100/edited['weight']
            edited.each do |key,value|
                next if %w[weight authenticity_token Name product defaultWeight controller action].include?(key)
                product.update_attributes(key => value * temp)
            end
        end
        product.save
        return 'success'
    end
    def deleteUserProduct(product)
        temp = ProductInfoDbModel.find(product)
        temp.delete
        tempR = RecipeProductsDbModel.where(IDP:product).delete_all
    end
    def searchForNutrient(nutrient,sort)
        case sort
        when '1'
            return ProductInfoDbModel.limit(20).order("\"#{nutrient}\" DESC NULLS LAST")
        when '2'
            return ProductInfoDbModel.limit(20).order("\"#{nutrient}\" ASC NULLS LAST")
        end
    end
end