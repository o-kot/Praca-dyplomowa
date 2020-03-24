class UserLoginViewModel
    def logUser(userEmail, userPassword)  
        user = UserInterface.new(ConfigDb::USERCONFIG.constantize.new)
        user.logUser(userEmail, userPassword)      
    end
    private
    @userEmail = ''
    @userPassword = ''
end