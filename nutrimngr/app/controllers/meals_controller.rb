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
        @meal = EatenViewModel.new(session[:sessionID])
        @meal.getMeal
    end
end