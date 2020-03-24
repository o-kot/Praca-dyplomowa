class LoginController < ApplicationController
    def login
        accessingUser = UserLoginViewModel.new
        if(accessingUser.logUser(params['email'], params['password']))
            render plain: 'success'   
        else
            render plain: 'error'      
        end 
    end    
end