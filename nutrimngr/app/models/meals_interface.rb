class MealsInterface
    def initialize(object,id)           
        @object = object     
        @object.setID(id)
    end
    def getMeal
        @object.getMeal
    end
    def addMeal
        @object.addMeal
    end
    def editMeal(id) 
        @object.editMeal(id)
    end
    def deleteMeal(id) 
        @object.deleteMeal(id)
    end
    def addProduct(meal,product,weight)
        @object.addProduct(meal,product.weight)
    end
    def addCustomProduct
        @object.addCustomProduct
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
end