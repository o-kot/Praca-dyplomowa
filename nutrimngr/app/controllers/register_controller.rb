class RegisterController < ApplicationController
    def register
        newUser = UserPg.new
        if(newUser.saveUser(params['email'], params['password']))
            render plain: 'success'            
        else
            render plain: 'error'
        end 
    end    
end