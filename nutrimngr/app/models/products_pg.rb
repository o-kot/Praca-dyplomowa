class ProductsPg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def getProductInfo
        newProductInfo = ProductInfoDbModel.where(IDU:@userID).first
    end
    def getUserProductInfo
        newUserProductInfo = ProductInfoDbModel.where(IDU:@userID).first
    end
    def addUserProduct(name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,cholesterol,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe,weight)
        if ProductInfoDbModel.where(Name:name).exists?
            return 'Produkt o takiej nazwie istnieje już w bazie danych.'  
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
                newUserProduct.Calories = calories * temp
                newUserProduct.Protein = protein * temp
                newUserProduct.Carbs = carbs * temp
                newUserProduct.Fat = fat * temp
                newUserProduct.Sugars = sugars * temp
                newUserProduct.Fiber = fiber * temp
                newUserProduct.Omega3 = omega3 * temp
                newUserProduct.ALA = ala * temp
                newUserProduct.SFA = sfa * temp
                newUserProduct.WNKT = wnkt * temp
                newUserProduct.Trans = trans * temp
                newUserProduct.Cholesterol = cholesterol * temp
                newUserProduct.Valine = valine * temp
                newUserProduct.Isoleucine = isoleucine * temp
                newUserProduct.Leucine = leucine * temp
                newUserProduct.Lysine = lysine * temp
                newUserProduct.Methionine = methionine * temp
                newUserProduct.Threonine = threonine * temp
                newUserProduct.Tryptophan = tryptophan * temp
                newUserProduct.Phenylalanine = phenylalanine * temp
                newUserProduct.VitA = vitA * temp
                newUserProduct.VitB1 = vitB1 * temp
                newUserProduct.VitB2 = vitB2 * temp
                newUserProduct.VitB3 = vitB3 * temp
                newUserProduct.VitB4 = vitB4 * temp
                newUserProduct.VitB5 = vitB5 * temp
                newUserProduct.VitB6 = vitB6 * temp
                newUserProduct.VitB9 = vitB9 * temp
                newUserProduct.VitB12 = vitB12 * temp
                newUserProduct.VitC = vitC * temp
                newUserProduct.VitD = vitD * temp
                newUserProduct.VitE = vitE * temp
                newUserProduct.VitH = vitH * temp
                newUserProduct.VitK = vitK * temp
                newUserProduct.Cl = cl * temp
                newUserProduct.Zn = zn * temp
                newUserProduct.F = f * temp
                newUserProduct.P = p * temp
                newUserProduct.I = i * temp
                newUserProduct.Mg = mg * temp
                newUserProduct.Cu = cu * temp
                newUserProduct.K = k * temp
                newUserProduct.Se = se * temp
                newUserProduct.Na = na  * temp
                newUserProduct.Ca = ca * temp
                newUserProduct.Fe = fe * temp
            end
        newUserProduct.save
        return 'success'
        end
    end
    def editUserProduct(product) 
        @object.editUserProduct(product)
    end
    def deleteUserProduct(product)
        @object.deleteUserProduct(product)
    end
end