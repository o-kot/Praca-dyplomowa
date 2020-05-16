class RecipesInterface
    def initialize(object,id)           
        @object = object     
        @object.setID(id)
    end
    def set(id,name)
        @object.set(id,name)
    end
    def getRecipeList
        @object.getRecipeList
    end
    def addRecipe(name)
        @object.addRecipe(name)
    end
    def editRecipe(id,name) 
        @object.editRecipe(id,name)
    end
    def deleteRecipe(id) 
        @object.deleteRecipe(id)
    end
    def find(id)
        @object.find(id)
    end
    def addProduct(recipe,product)
        @object.addProduct(recipe,product)
    end
    def deleteProduct(recipe,product)
        @object.deleteProduct(recipe,product)
    end
    def weightProduct(recipe,product,weight)
        @object.weightProduct(recipe,product,weight)
    end
    def getProductList(recipe)
        @object.getProductList(recipe)
    end
    def createCompleteRecipe(recipe)
        @object.createCompleteRecipe(recipe)
    end
    def calculateNutrition(recipe)
        @object.calculateNutrition(recipe)
    end
    def measureRecipe(recipe,how,measurement)
        @object.measureRecipe(recipe,how,measurement)
    end
    def findLast
        @object.findLast
    end
    def findLastComplete
        @object.findLastComplete
    end
    def findAmount(completeRecipe)
        @object.findAmount(completeRecipe)
    end
    def calculateWhatsLeft(recipe,eaten)
        @object.calculateWhatsLeft(recipe,eaten)
    end
    def getCompleteRecipeList
        @object.getCompleteRecipeList
    end
    def markAsEaten(recipe)
        @object.markAsEaten(recipe)
    end
end