class RegisterController < ApplicationController
    def register
        if params['password'] != params['confirm_password']
            render plain: 'Podane hasła nie są identyczne'
        elsif params['email'] || params['password'] || params['confirm_password'] == ''
            render plain: 'Formularz zawiera niewypełnione pola.'
        else
            newUser = UserRegisterViewModel.new
            render plain: newUser.saveUser(params['email'], params['password'])         
        end
    end    
end