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
        @eaten = EatenViewModel.new(session[:sessionID])
        @eaten = @eaten.getEaten(@today)
        @gotten = EatenViewModel.new(session[:sessionID])
        @gotten = @gotten.calculateDailyRequisition(@today)
        @requisition = UserRequisitionViewModel.new(session[:sessionID])
        @requisition = @requisition.getUserRequisition
        @resultkc = ''
        if @requisition.present?
            if @gotten.Calories <= 0.9 * @requisition.Calories
                @resultkc = 'too-little'
            elsif @gotten.Calories >= 1.1 * @requisition.Calories
                @resultkc = 'too-much'
            else @resultkc = 'neutral'
            end
            @resultp = ''
            if @gotten.Protein <= 0.9 * @requisition.Protein
                @resultp = 'too-little'
            elsif @gotten.Protein >= 1.1 * @requisition.Protein
                @resultp = 'too-much'
            else @resultp = 'neutral'
            end
            @resultc = ''
            if @gotten.Carbs <= 0.9 * @requisition.Carbs
                @resultc = 'too-little'
            elsif @gotten.Carbs >= 1.1 * @requisition.Carbs
                @resultc = 'too-much'
            else @resultc = 'neutral'
            end
            @resultf = ''
            if @gotten.Fat <= 0.9 * @requisition.Fat
                @resultf = 'too-little'
            elsif @gotten.Fat >= 1.1 * @requisition.Fat
                @resultf = 'too-much'
            else @resultf = 'neutral'
            end
        end
    end
end