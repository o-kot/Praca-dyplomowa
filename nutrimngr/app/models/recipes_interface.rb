class RecipesInterface
    def initialize(object,id)           
        @object = object     
        @object.setID(id)
    end
    def getRecipe
        @object.getRecipe
    end
    def addRecipe(name)
        @object.addRecipe(name)
    end
    def editRecipe(id) 
        @object.editRecipe(id)
    end
    def deleteRecipe(id) 
        @object.deleteRecipe(id)
    end
    def addProduct(recipe,product)
        @object.addProduct(recipe,product)
    end
    def deleteProduct(recipe,product)
        @object.deleteProduct(recipe,product)
    end
    def weightProduct(id,weight)
        @object.weightProduct(id,weight)
    end
    def getProductList(recipe)
        @object.getProductList(recipe)
    end
    def createCompleteRecipe
        @object.createCompleteRecipe
    end
    def calculateNutrition(recipe)
        @object.calculateNutrition(recipe)
    end
    def calculateWhatsLeft(recipe,eaten)
        @object.calculateWhatsLeft(recipe,eaten)
    end
    def getCompleteRecipes
        @object.getRecipe
    end
    def markAsEaten(recipe)
        @object.markAsEaten(recipe)
    end
end