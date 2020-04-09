class ActivityViewModel
    def saveActivity(id)  
        activity = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        activity.saveActivity    
    end
    def editActivity(id)
        activity = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        activity.editActivity
    end
    def
        getActivity
        activity = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        activity.getActivity
    end
    @activityDesc = ''
    private
    @activityID = ''
    @activityValue = ''
end