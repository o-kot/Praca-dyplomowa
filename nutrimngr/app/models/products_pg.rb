class ProductsPg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def getProductInfo
        newProductInfo = ProductInfoDbModel.where(IDU:@userID).first
    end
    def getProductList(userOnly)
        userOnly ? ProductInfoDbModel.where(IDU:@userID) : ProductInfoDbModel.all
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
                newUserProduct.Protein = protein * temp rescue nil
                newUserProduct.Carbs = carbs * temp rescue nil
                newUserProduct.Fat = fat * temp rescue nil
                newUserProduct.Sugars = sugars * temp rescue nil
                newUserProduct.Fiber = fiber * temp rescue nil
                newUserProduct.Omega3 = omega3 * temp rescue nil
                newUserProduct.ALA = ala * temp rescue nil
                newUserProduct.SFA = sfa * temp rescue nil
                newUserProduct.WNKT = wnkt * temp rescue nil
                newUserProduct.Trans = trans * temp rescue nil
                newUserProduct.Cholesterol = cholesterol * temp rescue nil
                newUserProduct.Valine = valine * temp rescue nil
                newUserProduct.Isoleucine = isoleucine * temp rescue nil
                newUserProduct.Leucine = leucine * temp rescue nil
                newUserProduct.Lysine = lysine * temp rescue nil
                newUserProduct.Methionine = methionine * temp rescue nil
                newUserProduct.Threonine = threonine * temp rescue nil
                newUserProduct.Tryptophan = tryptophan * temp rescue nil
                newUserProduct.Phenylalanine = phenylalanine * temp rescue nil
                newUserProduct.VitA = vitA * temp rescue nil
                newUserProduct.VitB1 = vitB1 * temp rescue nil
                newUserProduct.VitB2 = vitB2 * temp rescue nil
                newUserProduct.VitB3 = vitB3 * temp rescue nil
                newUserProduct.VitB4 = vitB4 * temp rescue nil
                newUserProduct.VitB5 = vitB5 * temp rescue nil
                newUserProduct.VitB6 = vitB6 * temp rescue nil
                newUserProduct.VitB9 = vitB9 * temp rescue nil
                newUserProduct.VitB12 = vitB12 * temp rescue nil
                newUserProduct.VitC = vitC * temp rescue nil
                newUserProduct.VitD = vitD * temp rescue nil
                newUserProduct.VitE = vitE * temp rescue nil
                newUserProduct.VitH = vitH * temp rescue nil
                newUserProduct.VitK = vitK * temp rescue nil
                newUserProduct.Cl = cl * temp rescue nil
                newUserProduct.Zn = zn * temp rescue nil
                newUserProduct.F = f * temp rescue nil
                newUserProduct.P = p * temp rescue nil
                newUserProduct.I = i * temp rescue nil
                newUserProduct.Mg = mg * temp rescue nil
                newUserProduct.Cu = cu * temp rescue nil
                newUserProduct.K = k * temp rescue nil
                newUserProduct.Se = se * temp rescue nil
                newUserProduct.Na = na  * temp rescue nil
                newUserProduct.Ca = ca * temp rescue nil
                newUserProduct.Fe = fe * temp rescue nil
            end
        newUserProduct.save
        return 'success'
        end
    end
    def editUserProduct(product) 
        @object.editUserProduct(product)
    end
    def deleteUserProduct(product)
        temp = ProductInfoDbModel.find(product)
        temp.delete
    end
end