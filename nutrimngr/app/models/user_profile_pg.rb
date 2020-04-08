class UserProfile
    def initialize(object)     
        @object = object     
    end
    def saveUserData (bday,gender,height)
        newUserData = UserDataDbModel.new
        newUserData.IDU = sessionID
        newUserData.BirthDate = bday
        newUserData.IsWoman = gender
        newUserData.Height = height
        newUserData.save
        return 'success'
    end
    def editUserData (int)
        case data
        when 1
            newUserData = UserDataDbModel.where(ID==sessionID)
            newUserData.BirthDate = date
            newUserData.save
        when 2
            newUserData = UserDataDbModel.where(ID==sessionID)
            newUserData.IsWoman = gender
            newUserData.save
        when 3
            newUserData = UserDataDbModel.where(ID==sessionID)
            newUserData.Height = height
            newUserData.save
        else "Error: data has an invalid value (#{data})"
        end
    end
    def getUserData ()
        newUserData = UserDataDbModel.where(ID==sessionID)
    end
    def saveUserMeasurements (weight,waist,hips)
        newUserMeasurements = UserMeasurementsDbModel.new
        newUserMeasurements.IDU = sessionID
        newUserMeasurements.Weight = weight
        newUserMeasurements.Waist = waist
        newUserMeasurements.Hips = hips
        newUserMeasurements.save
        return 'success'
    end
    def editUserMeasurements (int)
        case measurement
        when 1
            newUserMeasurements = UserMeasurementsDbModel.where(ID==sessionID)
            newUserMeasurements.Weight = weight
            newUserMeasurements.save
        when 2
            newUserMeasurements = UserMeasurementsDbModel.where(ID==sessionID)
            newUserMeasurements.Waist = waist
            newUserMeasurements.save
        when 3
            newUserMeasurements = UserMeasurementsDbModel.where(ID==sessionID)
            newUserMeasurements.Hips = hips
            newUserMeasurements.save
        else "Error: data has an invalid value (#{measurement})"
        end

    end
    def getUserMeasurements ()
        newUserMeasurements = UserMeasurementsDbModel.where(ID==sessionID)
    end
    def saveActivity (int)
        newUserActivity = UserDataDbModel.where(ID==sessionID)
        newUserActivity.IDA = act
        newUserActivity.save
        return 'success'
    end
    def editActivity (act)
        newUserActivity = UserDataDbModel.where(ID==sessionID)
        newUserActivity.IDA = act
        newUserActivity.save
        return 'success'
    end
    def getActivity ()
        newUserActivity = UserDataDbModel.where(ID==sessionID)
    end
    def saveTarget (targ)
        newUserTarget = UserDataDbModel.where(ID==sessionID)
        newUserTarget.IDT = targ
        newUserTarget.save
        return 'success'
    end
    def editTarget (targ)
        newUserTarget = UserDataDbModel.where(ID==sessionID)
        newUserTarget.IDT = targ
        newUserTarget.save
        return 'success'
    end
    def getTarget ()
        newUserTarget = UserDataDbModel.IDT.where(ID==sessionID)
    end
    def calculateUserRequisition(gender,height,weight,activity,age,target)  
        case gender
        when 0
            @PPM = 66,47 + 13,75*weight + 5*height - 6,78*age
        when 1
            @PPM = 665,1 + 9,567*weight + 1,85*height - 4,87*age
        else "Error: data has an invalid value (#{data})"
        end
        @PAL = Activity.PAL.where(ID==ativity)        
        @CPM = @PPM * @PAL
        newUserRequisition = UserMeasurementsDbModel.new
        newUserRequisition.IDU = sessionID
        newUserRequisition.PPM = @PPM
        newUserRequisition.CPM = @CPM
        newUserRequisition.save
        case target
        when 1
            @targetCalories = @CPM - 300
            return @targetCalories
        when 2
            @targetCalories = @CPM - 50
            return @targetCalories
        when 3
            @targetCalories = @CPM + 250
            return @targetCalories
        else "Error: data has an invalid value (#{data})"
        end
    end
    def saveUserRequisition ()
        newUserRequisition = UserRequisitionDbModel.where(ID==sessionID)
        newUserRequisition.TargetCalories = calories

        newUserRequisition.save
        return 'success'
    end
    def modifyUserRequisition (calories)
        newUserRequisition = UserRequisitionDbModel.where(ID==sessionID)
        @target = UserDataDbModel.IDT.where(ID==sessionID)
        if(calories < newUserRequisition.PPM)
            return 'Docelowa dzienna kaloryczność nie może być mniejsza niż Twoja podstawowa przemiana materii'
        elsif ((calories < UserRequisition.CPM & @target = 3) || (calories > UserRequisition.CPM - 50 & target = 1) || ((UserRequisition.CPM -100 >= calories || calories > UserRequisition.CPM ) & target =2))
            return 'Podana wartość kalorii nie pozwoli Ci osiągnąć Twojego celu'
        else
            saveUserRequisition(calories)
        end
    end
    def getUserRequisition ()
        newUserRequisition = UserRequisitionDbModel.where(ID==sessionID)
    end
end