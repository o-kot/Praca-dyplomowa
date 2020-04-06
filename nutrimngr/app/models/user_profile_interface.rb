class UserProfile
    def initialize(object)     
        @object = object     
    end
    def saveUserData (date,float,bool)
        @object.saveUserData (date,float,bool)
    end
    def editUserData (int)
        @object.editUserData (int)
    end
    def getUserData ()
        @object.getUserData ()
    end
    def saveUserMeasurements (float,float,float)
        @object.saveUserMeasurements (float,float,float)
    end
    def editUserMeasurements (int)
        @object.editUserMeasurements (int)
    end
    def getUserMeasurements ()
        @object.getUserMeasurements ()
    end
    def saveActivity (int)
        @object.saveActivity (int)
    end
    def editActivity (int)
        @object.editActivity (int)
    end
    def getActivity ()
        @object.getActivity ()
    end
    def saveTarget (int)
        @object.saveTarget (int)
    end
    def editTarget (int)
        @object.editTarget (int)
    end
    def getTarget ()
        @object.getTarget ()
    end
    def calculateUserRequisition(bool,int,float,int,int,int)
        @object.calculateUserRequisition(bool,int,float,int,int,int)
    end
    def getUserRequisition ()
        @object.getUserRequisition ()
    end
end