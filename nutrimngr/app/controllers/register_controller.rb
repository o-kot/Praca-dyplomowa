class RegisterController < ApplicationController
    def register
        if params['password'] != params['confirm_password']
            render plain: 'Podane hasła nie są identyczne'
        elsif params['email'].blank? || params['password'].blank? || params['confirm_password'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.'
        else
            newUser = UserRegisterViewModel.new
            render plain: newUser.saveUser(params['email'], params['password'])                    
        end
    end    
end