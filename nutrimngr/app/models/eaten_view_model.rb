class EatenViewModel
    attr_accessor :eatenTime, :eatenCustomName, :eatenCalories, :eatenProtein, :eatenCarbs, :eatenFat, :eatenSugars, :eatenFiber, :eatenOmega3, :eatenALA, :eatenSFA, :eatenWNKT, :eatenTrans, :eatenValine, :eatenIsoleucine, :eatenLeucine, :eatenLysine, :eatenMehionine, :eatenThreonine, :eatenTryptophan, :eatenPhenylalanine, :eatenVitA, :eatenVitB1, :eatenVitB2, :eatenVitB3, :eatenVitB4, :eatenVitB5, :eatenVitB6, :eatenVitB9, :eatenVitB12, :eatenVitC, :eatenVitD, :eatenVitE, :eatenVitH, :eatenVitK, :eatenCl, :eatenZn, :eatenF, :eatenP, :eatenI, :eatenMg, :eatenCu, :eatenK, :eatenSe, :eatenNa, :eatenCa, :eatenFe, :eatenCholesterol
    def initialize(id)
        @userID = id
    end
    def getMeal
        meal = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        meal = meal.getMeal
        @eatenMealID = meal.IDP rescue ''
        @eatenDate = meal.Date rescue ''
        @eatenTime = meal.Time rescue ''
        @eatenIDProduct = meal.IDPr rescue ''
        @eatenIDRecipe = meal.IDDR rescue ''
        @eatenCustomName = meal.CustomProductName rescue ''
        @eatenWeight = meal.Weight rescue ''
        @eatenPortions = meal.Portions rescue ''
        @eatenCalories = meal.Calories rescue ''
        @eatenProtein = meal.Protein rescue ''
        @eatenCarbs = meal.Carbs rescue ''
        @eatenFat = meal.Fat rescue ''
        @eatenSugars = meal.Sugars rescue ''
        @eatenFiber = meal.Fiber rescue ''
        @eatenOmega3 = meal.Omega3 rescue ''
        @eatenALA = meal.ALA rescue ''
        @eatenSFA = meal.SFA rescue ''
        @eatenWNKT = meal.WNKT rescue ''
        @eatenTrans = meal.Trans rescue ''
        @eatenCholesterol = meal.Cholesterol rescue ''
        @eatenValine = meal.Valine rescue ''
        @eatenIsoleucine = meal.Isoleucine rescue ''
        @eatenLeucine = meal.Leucine rescue ''
        @eatenLysine = meal.Lysine rescue ''
        @eatenMethionine = meal.Methionine rescue ''
        @eatenThreonine = meal.Threonine rescue ''
        @eatenTryptophan = meal.Tryptophan rescue ''
        @eatenPhenylalanine = meal.Phenylalanine rescue ''
        @eatenVitA = meal.VitA rescue ''
        @eatenVitB1 = meal.VitB1 rescue ''
        @eatenVitB2 = meal.VitB2 rescue ''
        @eatenVitB3 = meal.VitB3 rescue ''
        @eatenVitB4 = meal.VitB4 rescue ''
        @eatenVitB5 = meal.VitB5 rescue ''
        @eatenVitB6 = meal.VitB6 rescue ''
        @eatenVitB9 = meal.VitB9 rescue ''
        @eatenVitB12 = meal.VitB12 rescue ''
        @eatenVitC = meal.VitC rescue ''
        @eatenVitD = meal.VitD rescue ''
        @eatenVitE = meal.VitE rescue ''
        @eatenVitH = meal.VitH rescue ''
        @eatenVitK = meal.VitK rescue ''
        @eatenCl = meal.Cl rescue ''
        @eatenZn = meal.Zn rescue ''
        @eatenF = meal.F rescue ''
        @eatenP = meal.P rescue ''
        @eatenI = meal.I rescue ''
        @eatenMg = meal.Mg rescue ''
        @eatenCu = meal.Cu rescue ''
        @eatenK = meal.K rescue ''
        @eatenSe = meal.Se rescue ''
        @eatenNa = meal.Na rescue ''
        @eatenCa = meal.Ca rescue ''
        @eatenFe = meal.Fe rescue ''       
    end
    def addProduct(meal,product)
    end
    def addCustomProduct(meal)
    end
    def addCompleteRecipe(meal,recipe,portion)
    end
    def calculateMealRequisition(meal)
    end
    def calculateDailyRequisition(date)
    end
    private
    @eatenID = ''
    @eatenIDU = ''
end
