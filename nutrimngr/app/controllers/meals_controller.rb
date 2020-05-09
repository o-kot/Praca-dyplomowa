require 'date'

class MealsController < ApplicationController
    def meals
        if !session[:sessionID]
            redirect_to "index/index"
        end
        if session[:message]
            @message=session[:message]
            session[:message]=nil
        end        
        @today = Date.today 
        @meals = MealViewModel.new(session[:sessionID])
        @meals.getMeals
        @eaten = EatenViewModal.newnew(session[:sessionID])
        @eaten(@today)
 
    end
end