class UserProfilePg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def saveUserData (bday,gender,height)
        newUserData = UserDataDbModel.new
        newUserData.IDU = @userID
        newUserData.BirthDate = bday
        newUserData.IsWoman = gender
        newUserData.Height = height
        newUserData.save
        return 'success'
    end
    def editUserData (what,edited)
        case what
        when 1
            newUserData = UserDataDbModel.where(IDU:@userID).first
            newUserData.BirthDate = edited
            newUserData.save
        when 2
            newUserData = UserDataDbModel.where(IDU:@userID).first
            newUserData.IsWoman = edited
            newUserData.save
        when 3
            newUserData = UserDataDbModel.where(IDU:@userID).first
            newUserData.Height = edited
            newUserData.save
        else "Error: data has an invalid value (#{what})"
        end
        return 'success'
    end
    def getUserData
        newUserData = UserDataDbModel.where(IDU:@userID).first
    end
    def saveUserMeasurements (weight,waist,hips)
        newUserMeasurements = UserMeasurementsDbModel.new
        newUserMeasurements.IDU = @userID
        newUserMeasurements.Weight = weight
        newUserMeasurements.Waist = waist
        newUserMeasurements.Hips = hips
        newUserMeasurements.save
        return 'success'
    end
    def editUserMeasurement(what,edited)
        case what
        when 1
            newUserMeasurements = UserMeasurementsDbModel.where(IDU:@userID).first
            newUserMeasurements.Weight = edited
            newUserMeasurements.save            
        when 2
            newUserMeasurements = UserMeasurementsDbModel.where(IDU:@userID).first
            newUserMeasurements.Waist = edited
            newUserMeasurements.save
        when 3
            newUserMeasurements = UserMeasurementsDbModel.where(IDU:@userID).first
            newUserMeasurements.Hips = edited
            newUserMeasurements.save            
        else "Error: data has an invalid value (#{what})"
        end
        return 'success'
    end
    def getUserMeasurements
        newUserMeasurements = UserMeasurementsDbModel.where(IDU:@userID).first
    end
    def saveActivity (activity)
        newUserActivity = UserDataDbModel.where(IDU:@userID).first
        newUserActivity.IDA = activity
        newUserActivity.save
        return 'success'
    end
    def editActivity (activity)
        newUserActivity = UserDataDbModel.where(IDU:@userID).first
        newUserActivity.IDA = activity
        newUserActivity.save
        return 'success'
    end
    def getActivity
        newActivityID = UserDataDbModel.where(IDU:@userID).first.IDA
        newActivity = ActivityDbModel.where(id:newActivityID).first
    end
    def saveTarget (target)
        newUserTarget = UserDataDbModel.where(IDU:@userID).first
        newUserTarget.IDT = target
        newUserTarget.save
        return 'success'
    end
    def editTarget (target)
        newUserTarget = UserDataDbModel.where(IDU:@userID).first
        newUserTarget.IDT = target
        newUserTarget.save
        return 'success'
    end
    def getTarget
        newTargetID = UserDataDbModel.where(IDU:@userID).first.IDT
        newTarget = TargetDbModel.where(id:newTargetID).first
    end
    def calculateUserRequisition(gender,height,weight,activity,age,target)  
        case gender
        when false
            ppm = 66.47 + 13.75*weight + 5*height - 6.78*age
        when true
            ppm = 665.1 + 9.567*weight + 1.85*height - 4.87*age
        else "Error: data has an invalid value (#{gender})"
        end
        pal = ActivityDbModel.where(id:activity).first.PAL        
        cpm = ppm.to_f * pal.to_f
        newUserRequisition = UserRequisitionDbModel.where(IDU:@userID).first
        if newUserRequisition.nil?
            newUserRequisition = UserRequisitionDbModel.new
        end
        newUserRequisition.PPM = ppm
        newUserRequisition.CPM = cpm
        newUserRequisition.save
        case target
        when 1
            targetCalories = cpm - 300
            return targetCalories.to_i
        when 2
            targetCalories = cpm - 50
            return targetCalories.to_i
        when 3
            targetCalories = cpm + 250
            return targetCalories.to_i
        else "Error: data has an invalid value (#{target})"
        end
    end
    def saveUserRequisition(calories)
        newUserRequisition = UserRequisitionDbModel.where(IDU:@userID).first
        newUserRequisition.TargetCalories = calories
        newUserRequisition.save
        return 'success'
    end
    def modifyUserRequisition(calories)
        newUserRequisition = UserRequisitionDbModel.where(IDU:@userID).first
        target = UserDataDbModel.where(IDU:@userID).first.IDT
        if(calories.to_i < newUserRequisition.PPM.to_i)
            return 'Docelowa dzienna kaloryczność nie może być mniejsza niż Twoja podstawowa przemiana materii'
        elsif ((calories < newUserRequisition.CPM & target == 3) || (calories > newUserRequisition.CPM - 50 & target == 1) || ((newUserRequisition.CPM - 100 >= calories || calories > newUserRequisition.CPM ) & target == 2))
            return 'Podana wartość kalorii nie pozwoli Ci osiągnąć Twojego celu'
        else
            return saveUserRequisition(calories)
        end
    end
    def getUserRequisition
        newUserRequisition = UserRequisitionDbModel.where(IDU:@userID).first
    end
end