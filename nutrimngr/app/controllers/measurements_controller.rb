class MeasurementsController < ApplicationController
    def measurements
    end
        if params['weight'].blank? || params['waist'].blank? || params['hips'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.'
        elsif params['weight'].!kind_of? Numeric
            render plain: "Błędna wartość w polu waga."
        elsif params['waist'].!kind_of? Numeric
            render plain: "Błędna wartość w polu obwód pasa."
        elsif params['weight'].!kind_of? Numeric
            render plain: "Błędna wartość w polu obwód bioder."
        else
            newMeasurements = UserMeasuremetsViewModel.new
            render plain: newMeasurements.saveUserMeasurements(params['weight'], params['waist'], params['hips'])                    
        end
   end