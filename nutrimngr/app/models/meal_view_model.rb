class MealViewModel
    attr_accessor :mealName
    def getMeals
        meals = UserInterface.new(ConfigDb::MEALS.constantize.new)
        meals.getMeals      
    end
end