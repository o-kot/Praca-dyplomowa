class UserDataViewModel
    attr_accessor :userDataHeight, :userDataBirthDay, :userDataIsWoman, :userDataActivityID, :userDataTargetID
    def initialize(id)
        @userID = id
    end
    def saveUserData(bday,height,gender)  
        data = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        data.saveUserData(bday,height,gender)      
    end
    def editUserData(what,id)
        data = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        data.editUserData(what,id)
    end
    def getUserData
        data = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        data = data.getUserData
        @userDataBirthDay = data.BirthDate rescue ''
        @userDataIsWoman = data.IsWoman rescue ''
        @userDataHeight = data.Height rescue ''
        @userDataTargetID = data.IDT rescue ''
        @userDataActivityID = data.IDA rescue ''
    end
end