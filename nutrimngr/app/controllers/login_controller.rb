class LoginController < ApplicationController
    def login
        if params['email'].blank? || params['password'].blank?
            render plain: 'Formularz zawiera niewypełnione pola' and return
        end
        accessingUser = UserLoginViewModel.new    
        if(accessingUser.logUser(params['email'], params['password']))
            session[:sessionID] = accessingUser.logUser(params['email'], params['password'])
            redirect_to "/profile/profile"
        else
            render plain: 'Adres e-mail lub hasło nieprawidłowe'      
        end 
    end    
    def logout
        session[:sessionID] = nil
        redirect_to '/'
    end
end