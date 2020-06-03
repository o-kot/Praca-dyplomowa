class MealsInterface
    def initialize(object,id)           
        @object = object     
        @object.setID(id)
    end
    def getMeals
        @object.getMeals
    end
    def getEaten(date)
        @object.getEaten(date)
    end
    def addMeal(date,time,meal)
        @object.addMeal(date,time,meal)
    end
    def deleteMeal(id) 
        @object.deleteMeal(id)
    end
    def addProduct(meal,product,weight)
        @object.addProduct(meal,product,weight)
    end
    def addCustomProduct(meal,name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,cholesterol,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe)
        @object.addCustomProduct(meal,name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,cholesterol,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe)
    end
    def findLast
        @object.findLast
    end
    def addCompleteRecipe(meal,recipe,portion)
        @object.addCompleteRecipe(meal,recipe,portion)
    end
    def calculateMealRequisition(meal)
        @object.calculateMealRequisition(meal)
    end
    def calculateDailyRequisition(date)
        @object.calculateDailyRequisition(date)
    end
    def decompose(customProduct,product,weight)
        @object.decompose(customProduct,product,weight)
    end
end