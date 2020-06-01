class UserRequisitionController < ApplicationController
    def requisition
        newUserData = UserDataViewModel.new(session[:sessionID])
        newUserData.getUserData
        newUserMeasurements = UserMeasurementsViewModel.new(session[:sessionID])
        newUserMeasurements.getLatestMeasurements
        if !newUserData.userDataHeight.present?
            render plain: 'Incomplete data' and return
        elsif !newUserMeasurements.userMeasurementsWeight.present?
            render plain: 'Incomplete measurements' and return
        elsif newUserData.userDataActivityID.nil?
            render plain: 'Incomplete activity' and return    
        elsif newUserData.userDataTargetID.nil?
            render plain: 'Incomplete target' and return
        else
            userAge = Date.today.year - newUserData.userDataBirthDay.year
            if(newUserData.userDataBirthDay.month - Date.today.month > 0)
                userAge-=1
            end
            newUserRequisition = UserRequisitionViewModel.new(session[:sessionID])
            kcal = newUserRequisition.calculateUserRequisition(newUserData.userDataIsWoman,newUserData.userDataHeight,newUserMeasurements.userMeasurementsWeight,newUserData.userDataActivityID,userAge,newUserData.userDataTargetID)
            if kcal  
                redirect_to modal_path(body: 'profile/requisition', title: 'Twoje zapotrzebowanie', energy: kcal)
            end
        end
    end
    def acceptRequisition
        newUserRequisition = UserRequisitionViewModel.new(session[:sessionID])
        if newUserRequisition.saveUserRequisition(params['calories']) == 'success'
            session[:message]='Zapisano zapotrzebowanie.'
            redirect_to '/profile/profile'         
        end
    end
    def modifyRequisition
        if params['calories'].blank?
            render plain: 'Nie wprowadzono docelowej kaloryczności.' and return
        end
        begin
            params['calories'] = Integer(params['calories'])
            if params['calories'] <0
                render plain: "Kalorie nie mogą być ujemne" and return
            end
        rescue
            render plain: 'Wprowadzono błędną wartość kaloryczności' and return
        end
        newTargetCalories = UserRequisitionViewModel.new(session[:sessionID])
        if newTargetCalories.modifyUserRequisition(params['calories']) == 'success'  
            session[:message]='Zapisano zapotrzebowanie.' 
            redirect_to '/profile/profile'
        else
            render plain: newTargetCalories.modifyUserRequisition(params['calories'])
        end
    end   
end