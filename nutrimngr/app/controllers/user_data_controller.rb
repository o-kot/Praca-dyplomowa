class UserDataController < ApplicationController
    def userData    
        if params['birthday'].blank? || params['gender'].blank? || params['height'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.' and return 
        end
        begin
            params['height'] = Integer(params['height'])
            if params['height'] < 0
                render plain: "Błędna wartość w polu wzrost." and return                
            end
        rescue
                render plain: "Błędna wartość w polu wzrost." and return                
        end            
        newData = UserDataViewModel.new(session[:sessionID])
        if newData.saveUserData(params['birthday'], params['gender'], params['height']) == 'success'
            session[:message]='Dane zostały zapisane.'
            redirect_to '/profile/profile'    
        end
    end
    def edit
        if params['edited'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.' and return
        end
        if params['what'] == '3'       
            begin
                params['edited'] = Integer(params['edited'])
                if params['edited'] < 0
                    render plain: "Wartość pola nie może być mniejsza niż 0." and return                
                end
            rescue
                render plain: "Wprowadzono błędną wartość"  and return
            end
        end
        newData = UserDataViewModel.new(session[:sessionID])
        if newData.editUserData(params['what'].to_i, params['edited']) == 'success'
            session[:message]='Dane zostały zmienione.'
            redirect_to '/profile/profile'    
        end    
    end      
end