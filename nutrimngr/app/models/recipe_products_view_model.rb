class RecipeProductsViewModel
    attr_accessor :recipeID, :productID, :productWeight
    def initialize(id)
        @userID = id
    end
    def addProduct(recipe,product)
        recipes = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipes.addProduct(recipe,product)
    end
    def deleteProduct(recipe,product)
        recipes = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipes.deleteProduct(recipe,product)
    end
    def weightProduct(recipe,product,weight)
        weightedProducts = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        weightedProducts.weightProduct(recipe,product,weight)
    end
    def getProductList(recipe)
        productList = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        productList.getProductList(recipe)
    end
end