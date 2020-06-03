class EatenViewModel
    attr_accessor :eatenTime, :eatenCustomName, :eatenCalories, :eatenProtein, :eatenCarbs, :eatenFat, :eatenSugars, :eatenFiber, :eatenOmega3, :eatenALA, :eatenSFA, :eatenWNKT, :eatenTrans, :eatenValine, :eatenIsoleucine, :eatenLeucine, :eatenLysine, :eatenMehionine, :eatenThreonine, :eatenTryptophan, :eatenPhenylalanine, :eatenVitA, :eatenVitB1, :eatenVitB2, :eatenVitB3, :eatenVitB4, :eatenVitB5, :eatenVitB6, :eatenVitB9, :eatenVitB12, :eatenVitC, :eatenVitD, :eatenVitE, :eatenVitH, :eatenVitK, :eatenCl, :eatenZn, :eatenF, :eatenP, :eatenI, :eatenMg, :eatenCu, :eatenK, :eatenSe, :eatenNa, :eatenCa, :eatenFe, :eatenCholesterol
    def initialize(id)
        @userID = id
    end
    def getEaten(date)
        mealsList = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        mealsList = mealsList.getEaten(date)
    end
    def addMeal(date,time,meal)
        newMeal = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        newMeal = newMeal.addMeal(date,time,meal)
    end
    def addProduct(meal,product,weight)
        newMeal = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        newMeal = newMeal.addProduct(meal,product,weight)
    end
    def addCustomProduct(meal,name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,cholesterol,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe)
        newMeal = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        newMeal = newMeal.addCustomProduct(meal,name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,cholesterol,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe)
    end
    def addCompleteRecipe(meal,recipe,portion)
        newMeal = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        newMeal = newMeal.addCompleteRecipe(meal,recipe,portion)
    end
    def calculateMealRequisition(meal)
        newEaten = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        newEaten = newEaten.calculateMealRequisition(meal)
    end
    def calculateDailyRequisition(date)
        gotten = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        gotten = gotten.calculateDailyRequisition(date)
    end
    def findLast
        last = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        last = last.findLast
    end
    def decompose(customProduct,product,weight)
        newEaten = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        newEaten = newEaten.decompose(customProduct,product,weight)
    end
    def delete(eaten)
        delEaten = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        delEaten = delEaten.deleteMeal(eaten)
    end
    private
    @eatenID = ''
    @eatenIDU = ''
    eatenDate = ''
    @eatenIDProduct = ''
    @eatenIDRecipe = ''
    @eatenWeight = ''
    @eatenPortions = ''
end
