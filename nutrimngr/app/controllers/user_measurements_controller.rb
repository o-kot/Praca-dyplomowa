class UserMeasurementsController < ApplicationController
    def userMeasurements
        if params['weight'].blank? || params['waist'].blank? || params['hips'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.' and return
        end
        begin
            params['weight'] = Float(params['weight'])
        rescue
            render plain: "Błędna wartość w polu waga." and return
        end
        begin
            params['waist'] = Float(params['waist'])
        rescue
            render plain: "Błędna wartość w polu obwod pasa." and return
        end
        begin
            params['hips'] = Float(params['hips'])
        rescue
            render plain: "Błędna wartość w polu obwód bioder." and return
        end
        newMeasurements = UserMeasurementsViewModel.new(session[:sessionID])
        if newMeasurements.saveUserMeasurements(params['weight'], params['waist'], params['hips']) == 'success'
            session[:message]='Wymiary zostały zapisane.'
            redirect_to '/profile/profile'
        end
    end
    def edit
        if params['edited'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.' and return
        end
        begin
            params['edited'] = Float(params['edited'])
        rescue
            render plain: "Wprowadzono błędną wartość." and return
        end
        newMeasurements = UserMeasurementsViewModel.new(session[:sessionID])
        if newMeasurements.editUserMeasurement(params['id'],params['what'].to_i, params['edited']) == 'success'
            session[:message]='Wymiar został zmieniony.'
            redirect_to '/profile/profile'
        end
    end
    def addNew
        if params['edited'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.' and return
        end
        begin
            params['edited'] = Float(params['edited'])
        rescue
            render plain: "Wprowadzono błędną wartość." and return
        end
        newMeasurements = UserMeasurementsViewModel.new(session[:sessionID])
        if newMeasurements.addNewMeasurement(params['what'].to_i, params['edited']) == 'success'
            session[:message]='Dodano nowy pomiar.'
            redirect_to '/profile/profile'
        end
    end
    def delete
        measurement = UserMeasurementsViewModel.new(session[:sessionID])
        if measurement.deleteUserMeasurement(params['id'],params['what']) == 'success'
            session[:message]='Usunięto pomiar.'
            redirect_to '/profile/profile'
        end
    end
end