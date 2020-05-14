class MealViewModel
    attr_accessor :mealName
    def initialize(id)
        @userID = id
    end
    def getMeals
        meals = MealsInterface.new(ConfigDb::MEALS.constantize.new,@userID)
        meals.getMeals
    end
end