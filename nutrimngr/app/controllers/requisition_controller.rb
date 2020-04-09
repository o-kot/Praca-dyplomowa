class UserRequisitionController < ApplicationController
    def userRequisition
    end
        newUserData = UserDataViewModel.new
        newUserData = getUserData
        newUserMeasurements = UserMeasurementsViewModel.new
        newUserMeasurements = getUserMeasuremets
        if !newUserData.exist?
            render plain: 'Incomplete data'
        elsif !newUserMeasurements.exist?
            render plain: 'Incomplete measurements'
        elsif newUserData.IDA.nil?
            render plain: 'Incomplete activity'        
        elsif newUserDataIDT.nil?
            render plain: 'Incomplete target'
        else
            @newDate = Date.today
            @userAge = Date.today - @newUserData.BirthDate
            newUserRequisition = UserRequisitionViewModel.new
            render plain: newUserRequisition.calculateUserRequisition(@newUserData.IsWoman,@newUserData.Height,@newUserMeasuremets.Weight,@newUserData.IDA,@userAge,@newUserData.IDT)           
        end
        def acceptRequisition
            newUserRequisition = UserRequisitionViewModel.new
            render plain: newUserRequisition.saveUserRequisition
        end
        def modifyRequisition
            if params['calories'].blank?
                render plain: 'Nie wprowadzono docelowej kaloryczności.'
            elsif !params['calories'].kind_of Integer
                render plain: 'Wprowadzono błędną wartość kaloryczności'
            else
                newTargetCalories = UserRequisitionViewModel.new
                render plain: newTargetCalories.modifyUserRequisition(params['calories'])    
        end
   end