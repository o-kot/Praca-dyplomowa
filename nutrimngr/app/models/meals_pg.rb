class MealsPg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def getMeal
        newMeal = EatenDbModel.where(IDU:@userID).first    
    end
    def addMeal
        newMeal = EatenDbModel.new  
        newMeal.IDU = @userID


        newMeal.save
        return 'success'
    end
    def editMeal(id) 
        newMeal = EatenDbModel.where(id:id).first   
    end
    def deleteMeal(id) 
        
    end
    def addProduct(meal,product,weight)
        
    end
    def addCustomProduct
      
    end
    def addCompleteRecipe(meal,recipe,portion)
       
    end
    def calculateMealRequisition(meal)
        
    end
    def calculateDailyRequisition(date)
       
    end
end