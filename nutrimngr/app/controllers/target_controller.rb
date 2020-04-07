class TargetController < ApplicationController
    def target
        if params['target'].blank?
            render plain: 'Cel nie został wybrany.'
        else
            newTarget = TargetViewModel.new
            render plain: newTarget.saveTarget(params['target'])                    
        end
    end
end