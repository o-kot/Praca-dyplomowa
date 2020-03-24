class UserPg
    def userExists? (email)
        UserDbModel.where(Login:email).exists?
    end
    def saveUser (email, passwd)
        if userExists? (email)
            return 'Użytkownik o podanym mailu jest już zarejestrowany w bazie.'    
        elsif !passwd.match /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/
            return 'Podane hasło nie spełnia wymogów bezpieczeństwa.'
        else
            newUser = UserDbModel.new
            newUser.Login = email
            newUser.Password = Digest::MD5.hexdigest(passwd)
            newUser.save
            return 'success'
        end
    end
    def logUser (email, passwd)
        if UserDbModel.where(Login:email,Password:(Digest::MD5.hexdigest(passwd))).exists?
            return true  
        else
            return false    
        end
    end
end