class UserDataViewModel
    def saveUserData(bday,height,gender)  
        data = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        data.saveUserData()      
    end
    def editUserData(id)
        data = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        data.editUserData()
    end
    def
        getUserData()
        data = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        data.getUserData()
    end
    $userDataBirthDay = ''
    $userDataIsWoman = ''
    $userDataHeight = ''
    private
    @userDataID = ''
    @userDataUserID = ''
    @userDataActivityID = ''
    @userDataTargetID = ''
end