class ProductsInterface
    def initialize(object,id)     
        @object = object  
        @object.setID(id)   
    end
    def getProductInfo
        @object.getProductInfo
    end
    def getProductList(userOnly)
        @object.getProductList(userOnly)
    end
    def addUserProduct(name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe,cholesterol,weight)
        @object.addUserProduct(name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe,cholesterol,weight)
    end
    def editUserProduct(product) 
        @object.editUserProduct(product)
    end
    def deleteUserProduct(product)
        @object.deleteUserProduct(product)
    end
end