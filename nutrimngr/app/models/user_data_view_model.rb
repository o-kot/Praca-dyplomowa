class UserDataViewModel
    attr_accessor :userDataHeight, :userDataActivityID, :userDataTargetID
    def initialize(id)
        @userID = id
    end
    def saveUserData(bday,height,gender)  
        data = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        data.saveUserData      
    end
    def editUserData(id)
        data = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        data.editUserData
    end
    def getUserData
        data = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID).getUserData
        userDataBirthDay = data.BirthDate rescue ''
        userDataIsWoman = data.IsWoman rescue ''
        userDataHeight = data.Height rescue ''
        userDataActivityID = data.IDA rescue ''
        userDataTargetID = data.IDT rescue ''
    end
    userDataBirthDay = ''
    userDataIsWoman = ''
    private
    @userID = -1
end