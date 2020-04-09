class UserProfilePg
    @userID = -1
    def setID (id)
        @userID = id
    end
    def saveUserData (bday,gender,height)
        newUserData = UserDataDbModel.new
        newUserData.IDU = userId
        newUserData.BirthDate = bday
        newUserData.IsWoman = gender
        newUserData.Height = height
        newUserData.save
        return 'success'
    end
    def editUserData (what)
        case what
        when 1
            newUserData = UserDataDbModel.where(id:@userID).first
            newUserData.BirthDate = edited
            newUserData.save
        when 2
            newUserData = UserDataDbModel.where(id:@userID).first
            newUserData.IsWoman = edited
            newUserData.save
        when 3
            newUserData = UserDataDbModel.where(id:@userID).first
            newUserData.Height = edited
            newUserData.save
        else "Error: data has an invalid value (#{what})"
        end
    end
    def getUserData
        newUserData = UserDataDbModel.where(id:@userID).first
    end
    def saveUserMeasurements (weight,waist,hips)
        newUserMeasurements = UserMeasurementsDbModel.new
        newUserMeasurements.IDU = userId
        newUserMeasurements.Weight = weight
        newUserMeasurements.Waist = waist
        newUserMeasurements.Hips = hips
        newUserMeasurements.save
        return 'success'
    end
    def editUserMeasurements (what)
        case what
        when 1
            newUserMeasurements = UserMeasurementsDbModel.where(id:@userID).first
            newUserMeasurements.Weight = edited
            newUserMeasurements.save
        when 2
            newUserMeasurements = UserMeasurementsDbModel.where(id:@userID).first
            newUserMeasurements.Waist = edited
            newUserMeasurements.save
        when 3
            newUserMeasurements = UserMeasurementsDbModel.where(id:@userID).first
            newUserMeasurements.Hips = edited
            newUserMeasurements.save
        else "Error: data has an invalid value (#{what})"
        end

    end
    def getUserMeasurements
        newUserMeasurements = UserMeasurementsDbModel.where(id:@userID).first
    end
    def saveActivity (activity)
        newUserActivity = UserDataDbModel.where(id:@userID).first
        newUserActivity.IDA = activity
        newUserActivity.save
        return 'success'
    end
    def editActivity (activity)
        newUserActivity = UserDataDbModel.where(id:@userID).first
        newUserActivity.IDA = activity
        newUserActivity.save
        return 'success'
    end
    def getActivity
        newUserActivity = UserDataDbModel.where(id:@userID).first
    end
    def saveTarget (target)
        newUserTarget = UserDataDbModel.where(id:@userID).first
        newUserTarget.IDT = target
        newUserTarget.save
        return 'success'
    end
    def editTarget (target)
        newUserTarget = UserDataDbModel.where(id:@userID).first
        newUserTarget.IDT = target
        newUserTarget.save
        return 'success'
    end
    def getTarget
        newUserTarget = UserDataDbModel.IDT.where(id:@userID).first
    end
    def calculateUserRequisition(gender,height,weight,activity,age,target)  
        case gender
        when 0
            ppm = 66.47 + 13.75*weight + 5*height - 6.78*age
        when 1
            ppm = 665.1 + 9.567*weight + 1.85*height - 4.87*age
        else "Error: data has an invalid value (#{gender})"
        end
        pal = Activity.PAL.where(id:ativity).first        
        cpm = ppm * PAL
        newUserRequisition = UserMeasurementsDbModel.new
        newUserRequisition.IDU = userId
        newUserRequisition.PPM = ppm
        newUserRequisition.CPM = cpm
        newUserRequisition.save
        case target
        when 1
            targetCalories = cpm - 300
            return targetCalories
        when 2
            targetCalories = cpm - 50
            return targetCalories
        when 3
            targetCalories = cpm + 250
            return targetCalories
        else "Error: data has an invalid value (#{target})"
        end
    end
    def saveUserRequisition
        newUserRequisition = UserRequisitionDbModel.where(id:@userID).first
        newUserRequisition.TargetCalories = calories

        newUserRequisition.save
        return 'success'
    end
    def modifyUserRequisition (calories)
        newUserRequisition = UserRequisitionDbModel.where(id:@userID).first
        target = UserDataDbModel.IDT.where(id:@userID)
        if(calories < newUserRequisition.PPM)
            return 'Docelowa dzienna kaloryczność nie może być mniejsza niż Twoja podstawowa przemiana materii'
        elsif ((calories < UserRequisition.CPM & target = 3) || (calories > UserRequisition.CPM - 50 & target = 1) || ((UserRequisition.CPM -100 >= calories || calories > UserRequisition.CPM ) & target =2))
            return 'Podana wartość kalorii nie pozwoli Ci osiągnąć Twojego celu'
        else
            saveUserRequisition(calories)
        end
    end
    def getUserRequisition
        newUserRequisition = UserRequisitionDbModel.where(id:@userID).first
    end
end