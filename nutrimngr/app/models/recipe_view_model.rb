class RecipeViewModel
    def initialize(id)
        @userID = id
    end
    def find(recipe)
        searched = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        searched.find(recipe)
    end
    def findLast
        last = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        last = last.findLast
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
        edited = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        edited = edited.editRecipe(recipe,name)
    end
    def deleteRecipe(id)
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe = recipe.deleteRecipe(id)
    end
    def set(id,name)
        recipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        recipe.set(id,name)
     end
end