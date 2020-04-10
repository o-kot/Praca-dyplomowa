class TargetViewModel
    attr_accessor :targetDescription, :targetID
    def initialize(id)
        @userID = id
    end
    def saveTarget(id)  
        target = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        target.saveTarget(id)
    end
    def editTarget(id)
        target = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        target.editTarget(id)
    end
    def
        getTarget
        target = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        target = target.getTarget
        @targetID = target.id rescue ''
        @targetDescription = target.Description rescue ''
    end
    private
end