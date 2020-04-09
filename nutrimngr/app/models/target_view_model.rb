class TargetViewModel
    def saveTarget(id)  
        target = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        target.saveTarget
    end
    def editTarget(id)
        target = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        target.editTarget
    end
    def
        getTarget
        target = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        target.getTarget
    end
    @targetDesc = ''
    private
    @activityID = ''
end