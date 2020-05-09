class RecipeViewModel
    attr_accessor :recipeName
    def initialize(id)
        @userID = id
    end
    def getRecipeList
        recipes = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipes = recipes.getRecipeList       
    end
    def addRecipe(name)
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe = recipe.addRecipe(name)
    end
    def editRecipe(recipe,name)
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe = recipe.editRecipe(id,name)
    end
    def deleteRecipe(id)
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe = recipe.deleteRecipe(id)
    end
    @recipeID = ''
    @recipeIsActive = ''
    private
    @recipeIsActive = ''
end