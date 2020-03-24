class UserRegisterViewModel    
    def registerUser(userEmail, userPassword)
        user = UserInterface.new(ConfigDb::USERCONFIG.constantize.new)
        user.registerUser(userEmail, userPassword)
    end
    private
    @userEmail = ''
    @userPassword = ''
end