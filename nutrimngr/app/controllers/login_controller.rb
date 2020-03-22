class LoginController < ApplicationController
    def login
        accessingUser = UserPg.new
        if(accessingUser.logUser(params['email'], params['password']))
            render plain: 'success'   
        else
            render plain: 'error'      
        end 
    end    
end