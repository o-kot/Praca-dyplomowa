class ActivityController < ApplicationController
    def activity
        if params['activity'] == '0'
            render plain: 'Stopień aktywności nie został wybrany.' and return
        else
            newActivity = ActivityViewModel.new(session[:sessionID])
            if newActivity.saveActivity(params['activity'])            
                redirect_to '/profile/profile'
            end                   
        end
    end
end