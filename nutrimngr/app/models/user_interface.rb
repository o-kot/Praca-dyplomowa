class UserInterface
    def initialize(object)     
        @object = object     
    end
    def userExists? (email)
        @object.userExists?(email)
    end

    def saveUser (email, passwd)
        @object.saveUser(email, passwd)
    end
    def logUser (email, passwd)
        @object.logUser(email, passwd)
    end
end