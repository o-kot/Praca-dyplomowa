class ProductInfoViewModel
    attr_accessor :productid, :productName, :productCalories, :productProtein, :productCarbs, :productFat, :productSugars, :productFiber, :productOmega3, :productALA, :productSFA, :productWNKT, :productTrans, :productValine, :productIsoleucine, :productLeucine, :productLysine, :productMethionine, :productThreonine, :productTryptophan, :productPhenylalanine, :productVitA, :productVitB1, :productVitB2, :productVitB3, :productVitB4, :productVitB5, :productVitB6, :productVitB9, :productVitB12, :productVitC, :productVitD, :productVitE, :productVitH, :productVitK, :productCl, :productZn, :productF, :productP, :productI, :productMg, :productCu, :productK, :productSe, :productNa, :productCa, :productFe, :productCholesterol
    def initialize (id)
        @userID = id
    end
    def getProductInfo(id)
        product = ProductsInterface.new(ConfigDb::PRODUCTS.constantize.new,@userID)
        product = product.getProductInfo(id)
        @productid = product.id rescue ''
        @productName = product.Name rescue ''
        @productCalories = product.Calories rescue ''
        @productProtein = product.Protein rescue ''
        @productCarbs = product.Carbs rescue ''
        @productFat = product.Fat rescue ''
        @productSugars = product.Sugars rescue ''
        @productFiber = product.Fiber rescue ''
        @productOmega3 = product.Omega3 rescue ''
        @productALA = product.ALA rescue ''
        @productSFA = product.SFA rescue ''
        @productWNKT = product.WNKT rescue ''
        @productTrans = productTrans rescue ''
        @productCholesterol = product.Cholesterol rescue ''
        @productValine = product.Valine rescue ''
        @productIsoleucine = product.Isoleucine rescue ''
        @productLeucine = product.Leucine rescue ''
        @productLysine = product.Lysine rescue ''
        @productMethionine = product.Methionine rescue ''
        @productThreonine = product.Threonine rescue ''
        @productTryptophan = product.Tryptophan rescue ''
        @productPhenylalanine = product.Phenylalanine rescue ''
        @productVitA = product.VitA rescue ''
        @productVitB1 = product.VitB1 rescue ''
        @productVitB2 = product.VitB2 rescue ''
        @productVitB3 = product.VitB3 rescue ''
        @productVitB4 = product.VitB4 rescue ''
        @productVitB5 = product.VitB5 rescue ''
        @productVitB6 = product.VitB6 rescue ''
        @productVitB9 = product.VitB9 rescue ''
        @productVitB12 = product.VitB12 rescue ''
        @productVitC = product.VitC rescue ''
        @productVitD = product.VitD rescue ''
        @productVitE = product.VitE rescue ''
        @productVitH = product.VitH rescue ''
        @productVitK = product.VitK rescue ''
        @productCl = product.Cl rescue ''
        @productZn = product.Zn rescue ''
        @productF = product.F rescue ''
        @productP = product.P rescue ''
        @productI = product.I rescue ''
        @productMg = product.Mg rescue ''
        @productCu = product.Cu rescue ''
        @productK = product.K rescue ''
        @productSe = product.Se rescue ''
        @productNa = product.Na rescue ''
        @productCa = product.Ca rescue ''
        @productFe = product.Fe rescue ''
    end
    def getProductList(userOnly = false)
        products = ProductsInterface.new(ConfigDb::PRODUCTS.constantize.new,@userID)
        productList = products.getProductList(userOnly)
    end
    def addUserProduct(name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe,cholesterol,weight)
        userProduct = ProductsInterface.new(ConfigDb::PRODUCTS.constantize.new,@userID)
        userProduct.addUserProduct(name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe,cholesterol,weight)
    end
    def editProductInfo(id,changes)
        userProduct = ProductsInterface.new(ConfigDb::PRODUCTS.constantize.new,@userID)
        userProduct.editProductInfo(id,changes)
    end
    def deleteUserProduct(id)
        userProduct = ProductsInterface.new(ConfigDb::PRODUCTS.constantize.new,@userID)
        userProduct.deleteUserProduct(id)
    end
end