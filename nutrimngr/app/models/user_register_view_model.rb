class UserRegisterViewModel    
    def saveUser(userEmail, userPassword)
        user = UserInterface.new(ConfigDb::USERCONFIG.constantize.new)
        user.saveUser(userEmail, userPassword)
    end
end