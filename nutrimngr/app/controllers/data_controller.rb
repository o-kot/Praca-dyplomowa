class DataController < ApplicationController
    def data    
        if params['birthday'].blank? || params['gender'].blank? || params['height'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.' and return 
        end
        begin
            params['height'] = Integer(params['height'])
        rescue
                render plain: "Błędna wartość w polu wzrost." and return                
        end            
        newData = UserDataViewModel.new(session[:sessionID])
        if newData.saveUserData(params['birthday'], params['gender'], params['height']) == 'success'
            redirect_to '/profile/profile'    
        end
    end
    def edit
        if params['edited'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.'
        end
        if params['what'] == '3'       
            begin
                params['edited'] = Integer(params['edited'])
            rescue
                render plain: "Wprowadzono błędną wartość"  and return
            end
        end
        newData = UserDataViewModel.new(session[:sessionID])
        if newData.editUserData(params['what'].to_i, params['edited']) == 'success'
            redirect_to '/profile/profile'    
        end    
    end      
end