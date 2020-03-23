class RegisterController < ApplicationController
    def register
        if params['password'] != params['confirm_password']
            render plain: 'Podane hasła nie są identyczne'
        else
            newUser = UserPg.new
            render plain: newUser.saveUser(params['email'], params['password'])         
        end
    end    
end