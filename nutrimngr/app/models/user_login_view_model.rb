class UserLoginViewModel
    def logUser(userEmail, userPassword)  
        user = UserInterface.new(ConfigDb::USERCONFIG.constantize.new)
        user.logUser(userEmail, userPassword)      
    end
end