class UserPg < UserInterface
    def userExists? (email)
        UserDbModel.where(Login:email).exists?
    end
    def saveUser (email, passwd)
        if userExists? (email)
            return false    
        else
            newUser = UserDbModel.new
            newUser.Login = email
            newUser.Password = Digest::MD5.hexdigest(passwd)
            newUser.save
            return true
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