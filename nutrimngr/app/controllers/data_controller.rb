class DataController < ApplicationController
    def data
    end
        if params['birthday'].blank? || params['gender'].blank? || params['height'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.'
        elsif params['height'].!kind_of? Integer
            render plain: "Błędna wartość w polu wzrost."
        else
            newData = UserDataViewModel.new
            render plain: newData.saveUserData(params['birthday'], params['gender'], params['height'])                    
        end
   end