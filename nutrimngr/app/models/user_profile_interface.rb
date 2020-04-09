class UserProfileInterface
    def initialize(object,id)           
        @object = object     
        @object.setID(id)
    end
    def saveUserData (bday,height,gender)
        @object.saveUserData(bday,height,gender)
    end
    def editUserData (what)
        @object.editUserData(what)
    end
    def getUserData 
        @object.getUserData
    end
    def saveUserMeasurements (weight,waist,hips)
        @object.saveUserMeasurements(weight,waist,hips)
    end
    def editUserMeasurements (what)
        @object.editUserMeasurements(what)
    end
    def getUserMeasurements 
        @object.getUserMeasurements
    end
    def saveActivity (activity)
        @object.saveActivity(activity)
    end
    def editActivity (activity)
        @object.editActivity(activity)
    end
    def getActivity 
        @object.getActivity 
    end
    def saveTarget (target)
        @object.saveTarget(target)
    end
    def editTarget (target)
        @object.editTarget(target)
    end
    def getTarget 
        @object.getTarget 
    end
    def calculateUserRequisition(gender,height,weight,activity,age,target)
        @object.calculateUserRequisition(gender,height,weight,activity,age,target)
    end
    def saveUserRequisition 
        @object.saveUserRequisition 
    end
    def modifyUserRequisition (calories)
        @object.modifyUserRequisition(calories)
    end
    def getUserRequisition 
        @object.getUserRequisition 
    end
end