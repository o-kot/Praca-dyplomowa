class RecipeProductsViewModel
    attr_accessor :recipeID, :productID, :productWeight
    def initialize
    end
    def addProduct(recipe,product)
        recipes = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipes.addProduct(recipe,product)
    end
    def deleteProduct(recipe,product)
        recipes = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipes.deleteProduct(recipe,product)
    end
    def find(recipe)
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe.find(recipe)
    end
    def weightProducts(recipe,products,weight)
        weightedProducts = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        weightedProducts.weightedProducts(recipe,products,weight)
    end
    def getProductList(recipe)
        productList = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        productList.getProductList(recipe)
    end
end