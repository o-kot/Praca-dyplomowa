class CompleteRecipeViewModel
    attr_accessor :completeRecipeID, :completeRecipeIsActive, :completeRecipeHasPortions, :completeRecipeIsWeighted, :completeRecipeCalories, :completeRecipeProtein, :completeRecipeCarbs, :completeRecipeFat, :completeRecipeSugars, :completeRecipeFiber, :completeRecipeOmega3, :completeRecipeALA, :completeRecipeSFA, :completeRecipeWNKT, :completeRecipeTrans, :completeRecipeValine, :completeRecipeIsoleucine, :completeRecipeLeucine, :completeRecipeLysine, :completeRecipeMehionine, :completeRecipeThreonine, :completeRecipeTryptophan, :completeRecipePhenylalanine, :completeRecipeVitA, :completeRecipeVitB1, :completeRecipeVitB2, :completeRecipeVitB3, :completeRecipeVitB4, :completeRecipeVitB5, :completeRecipeVitB6, :completeRecipeVitB9, :completeRecipeVitB12, :completeRecipeVitC, :completeRecipeVitD, :completeRecipeVitE, :completeRecipeVitH, :completeRecipeVitK, :completeRecipeCl, :completeRecipeZn, :completeRecipeF, :completeRecipeP, :completeRecipeI, :completeRecipeMg, :completeRecipeCu, :completeRecipeK, :completeRecipeSe, :completeRecipeNa, :completeRecipeCa, :completeRecipeFe, :completeRecipeCholesterol
    def initialize(id)
        @userID = id
    end
    def createCompleteRecipe(recipe)
        completeRecipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new)
        completeRecipe = completeRecipe.createCompleteRecipe(recipe)
    end
    def calculateNutrition(id)
        completeRecipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new)
        completeRecipe = completeRecipe.calculateNutrition(id)
    end
    def measureRecipe(recipe,how,measurement)
        completeRecipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new)
        completeRecipe = completeRecipeNa.measureRecipe(recipe,how,measurement)
    end
    def findAmount(completeRecipe)
        completeRecipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new)
        completeRecipe = completeRecipe.findAmount(completeRecipe)
    end
    def calculateWhatsLeft(id,eaten)
        completeRecipe = RecipesInterface.new(ConfigDb::RECIPES.constantize.new)
        completeRecipe = completeRecipe.calculateWhatsLeft(id,eaten)
    end
    def getCompleteRecipeList
        completeRecipes = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        completeRecipes = completeRecipes.getCompleteRecipeList
    end
    def findLast
        completeRecipes = RecipesInterface.new(ConfigDb::RECIPES.constantize.new,@userID)
        completeRecipes = completeRecipes.findLast
    end 
    def markAsEaten(id)
        completeRecipe = UserProfileInterface.new(ConfigDb::RECIPES.constantize.new)
        completeRecipe = completeRecipe.markAsEaten(id)
    end
    @completeRecipeRecipeID = completeRecipe.IDR rescue ''
    @completeRecipeIsActive = completeRecipe.IsActive rescue ''
    @completeRecipeHasPortions = completeRecipe.HasPortions rescue ''
    @completeRecipeHowManyPortions = completeRecipe.HowManyPortions rescue ''
    @completeRecipeIsWeighted = completeRecipe.IsWeighted rescue ''
    @completeRecipeWeight = completeRecipe.Weight rescue ''
    @completeRecipeCalories = completeRecipe.Calories rescue ''
    @completeRecipeProtein = completeRecipe.Protein rescue ''
    @completeRecipeCarbs = completeRecipe.Carbs rescue ''
    @completeRecipeFat = completeRecipe.Fat rescue ''
    @completeRecipeSugars = completeRecipe.Sugars rescue ''
    @completeRecipeFiber = completeRecipe.Fiber rescue ''
    @completeRecipeOmega3 = completeRecipe.Omega3 rescue ''
    @completeRecipeALA = completeRecipe.ALA rescue ''
    @completeRecipeSFA = completeRecipe.SFA rescue ''
    @completeRecipeWNKT = completeRecipe.WNKT rescue ''
    @completeRecipeTrans = completeRecipe.Trans rescue ''
    @completeRecipeCholesterol = completeRecipe.Cholesterol rescue ''
    @completeRecipeValine = completeRecipe.Valine rescue ''
    @completeRecipeIsoleucine = completeRecipe.Isoleucine rescue ''
    @completeRecipeLeucine = completeRecipe.Leucine rescue ''
    @completeRecipeLysine = completeRecipe.Lysine rescue ''
    @completeRecipeMethionine = completeRecipe.Methionine rescue ''
    @completeRecipeThreonine = completeRecipe.Threonine rescue ''
    @completeRecipeTryptophan = completeRecipe.Tryptophan rescue ''
    @completeRecipePhenylalanine = completeRecipe.Phenylalanine rescue ''
    @completeRecipeVitA = completeRecipe.VitA rescue ''
    @completeRecipeVitB1 = completeRecipe.VitB1 rescue ''
    @completeRecipeVitB2 = completeRecipe.VitB2 rescue ''
    @completeRecipeVitB3 = completeRecipe.VitB3 rescue ''
    @completeRecipeVitB4 = completeRecipe.VitB4 rescue ''
    @completeRecipeVitB5 = completeRecipe.VitB5 rescue ''
    @completeRecipeVitB6 = completeRecipe.VitB6 rescue ''
    @completeRecipeVitB9 = completeRecipe.VitB9 rescue ''
    @completeRecipeVitB12 = completeRecipe.VitB12 rescue ''
    @completeRecipeVitC = completeRecipe.VitC rescue ''
    @completeRecipeVitD = completeRecipe.VitD rescue ''
    @completeRecipeVitE = completeRecipe.VitE rescue ''
    @completeRecipeVitH = completeRecipe.VitH rescue ''
    @completeRecipeVitK = completeRecipe.VitK rescue ''
    @completeRecipeCl = completeRecipe.Cl rescue ''
    @completeRecipeZn = completeRecipe.Zn rescue ''
    @completeRecipeF = completeRecipe.F rescue ''
    @completeRecipeP = completeRecipe.P rescue ''
    @completeRecipeI = completeRecipe.I rescue ''
    @completeRecipeMg = completeRecipe.Mg rescue ''
    @completeRecipeCu = completeRecipe.Cu rescue ''
    @completeRecipeK = completeRecipe.K rescue ''
    @completeRecipeSe = completeRecipe.Se rescue ''
    @completeRecipeNa = completeRecipe.Na rescue ''
    @completeRecipeCa = completeRecipe.Ca rescue ''
    @completeRecipeFe = completeRecipe.Fe rescue ''
    private
    @completeRecipeRecipeID = ''
    @completeRecipeHowManyPortions = ''
    @completeRecipeWeight = ''
end