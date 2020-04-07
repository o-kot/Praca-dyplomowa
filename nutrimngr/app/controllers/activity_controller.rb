class ActivityController < ApplicationController
    def activity
        if params['activity'].blank?
            render plain: 'Stopień aktywności nie został wybrany.'
        else
            newActiviy = ActivityViewModel.new
            render plain: newActiviy.saveActivity(params['activity'])                    
        end
    end
end