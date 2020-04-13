class ActivityViewModel
    attr_accessor :activityID, :activityDescription
    def initialize(id)
        @userID = id
    end
    def saveActivity(id)  
        activity = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        activity.saveActivity(id)    
    end
    def editActivity(id)
        activity = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        activity.editActivity(id)
    end
    def getActivity
        activity = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        activity = activity.getActivity
        @activityID = activity.id rescue ''
        @activityDescription = activity.Description rescue ''
    end
    private    
    @activityValue = ''
end