class TargetController < ApplicationController
    def target
        if params['target'] == '0'
            render plain: 'Cel nie został wybrany.'
        else
            newTarget = TargetViewModel.new(session[:sessionID])
            if newTarget.saveTarget(params['target'])
                session[:message]='Cel został zapisany.'            
                redirect_to '/profile/profile'
            end        
        end
    end
end