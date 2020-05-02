class RecipeViewModel
    attr_accessor :recipeName
    def initialize(id)
        @userID = id
    end
    def getRecipe
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe = recipe.getRecipe
        @recipeID = recipe.id rescue ''
        @recipeName = recipe.Name rescue ''
        @recipeIsActive = recipe.IsActive rescue ''
    end
    def addRecipe(name)
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe = recipe.addRecipe(name)
    end
    def editRecipe(id)
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe = recipe.editRecipe(id)
    end
    def deleteRecipe(id)
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe = recipe.deleteRecipe(id)
    end
    private
    @recipeIsActive = ''
end