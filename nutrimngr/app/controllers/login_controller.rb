class LoginController < ApplicationController
    def login
        accessingUser = UserLoginViewModel.new
        if(accessingUser.logUser(params['email'], params['password']))
            session[:sessionID] = accessingUser.logUser(params['email'], params['password'])
            redirect_to "/profile/profile"
        else
            render plain: 'error'      
        end 
    end    
    def logout
        session[:sessionID] = nil
        redirect_to '/'
    end
end