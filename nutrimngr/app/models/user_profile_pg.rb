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
        newUserMeasurements.Date = Date.today
        newUserMeasurements.save
        return 'success'
    end
    def editUserMeasurement(id,what,edited)
        case what
        when 1
            newUserMeasurements = UserMeasurementsDbModel.where(id:id).first
            newUserMeasurements.update_attributes(Weight:edited)
        when 2
            newUserMeasurements = UserMeasurementsDbModel.where(id:id).first
            newUserMeasurements.update_attributes(Waist:edited)
        when 3
            newUserMeasurements = UserMeasurementsDbModel.where(id:id).first
            newUserMeasurements.update_attributes(Hips:edited)
        else "Error: data has an invalid value (#{what})"
        end
        return 'success'
    end
    def addNewMeasurement(what,measurement)
        case what
        when 1
            newUserMeasurement = UserMeasurementsDbModel.new
            newUserMeasurement.IDU = @userID
            newUserMeasurement.Date = Date.today
            newUserMeasurement.Weight = measurement
            newUserMeasurement.save
        when 2
            newUserMeasurement = UserMeasurementsDbModel.new
            newUserMeasurement.IDU = @userID
            newUserMeasurement.Date = Date.today
            newUserMeasurement.Waist = measurement
            newUserMeasurement.save
        when 3
            newUserMeasurement = UserMeasurementsDbModel.new
            newUserMeasurement.IDU = @userID
            newUserMeasurement.Date = Date.today
            newUserMeasurement.Hips = measurement
            newUserMeasurement.save
        else "Error: data has an invalid value (#{what})"
        end
        return 'success'
    end
    def deleteUserMeasurement(id,what)
        newUserMeasurements = UserMeasurementsDbModel.where(id:id).first

        case what
        when 'wght'
            firstM = UserMeasurementsDbModel.where("\"IDU\" = #{@userID} AND \"Weight\" IS NOT NULL").order('ID ASC').first.id
            lastM = UserMeasurementsDbModel.where("\"IDU\" = #{@userID} AND \"Weight\" IS NOT NULL").order('ID DESC').first.id
            unless firstM == id.to_i && firstM == lastM
                newUserMeasurements.update_attributes(Weight:nil)
            else 
                return ''                
            end
        when 'wst'
            firstM = UserMeasurementsDbModel.where("\"IDU\" = #{@userID} AND \"Waist\" IS NOT NULL").order('ID ASC').first.id
            lastM = UserMeasurementsDbModel.where("\"IDU\" = #{@userID} AND \"Waist\" IS NOT NULL").order('ID DESC').first.id
            unless firstM == id.to_i && firstM == lastM
                newUserMeasurements.update_attributes(Waist:nil)
            else
                return ''
            end
        when 'hps'
            firstM = UserMeasurementsDbModel.where("\"IDU\" = #{@userID} AND \"Hips\" IS NOT NULL").order('ID ASC').first.id
            lastM = UserMeasurementsDbModel.where("\"IDU\" = #{@userID} AND \"Hips\" IS NOT NULL").order('ID DESC').first.id
            unless firstM == id.to_i && firstM == lastM
                newUserMeasurements.update_attributes(Hips:nil)
            else 
                return ''                
            end    
        else "Error: data has an invalid value (#{what})"
        end
        if newUserMeasurements.Weight == nil && newUserMeasurements.Waist == nil && newUserMeasurements.Hips == nil
            newUserMeasurements.delete
        end
        return 'success'
    end
    def getUserMeasurements
        newUserMeasurements = UserMeasurementsDbModel.where(IDU:@userID).order("\"Date\" ASC")
    end
    def getLatestMeasurements
        if UserMeasurementsDbModel.where(IDU:@userID).exists?
            latestWeight = UserMeasurementsDbModel.where("\"IDU\" =? and \"Weight\" is not NULL",@userID).last.Weight
            latestHips = UserMeasurementsDbModel.where("\"IDU\" =? and \"Hips\" is not NULL",@userID).last.Hips
            latestWaist = UserMeasurementsDbModel.where("\"IDU\" =? and \"Waist\" is not NULL",@userID).last.Waist
        end
        return [latestWeight,latestHips,latestWaist]
    end
    def calculateDifference
        if UserMeasurementsDbModel.where(IDU:@userID).exists?
            latestWeight = UserMeasurementsDbModel.where("\"IDU\" =? and \"Weight\" is not NULL",@userID).last.Weight
            latestHips = UserMeasurementsDbModel.where("\"IDU\" =? and \"Hips\" is not NULL",@userID).last.Hips
            latestWaist = UserMeasurementsDbModel.where("\"IDU\" =? and \"Waist\" is not NULL",@userID).last.Waist
            firstWeight = UserMeasurementsDbModel.where("\"IDU\" =? and \"Weight\" is not NULL",@userID).first.Weight
            firstHips = UserMeasurementsDbModel.where("\"IDU\" =? and \"Hips\" is not NULL",@userID).first.Hips
            firstWaist = UserMeasurementsDbModel.where("\"IDU\" =? and \"Waist\" is not NULL",@userID).first.Waist
            diffWeight = latestWeight - firstWeight
            diffHips = latestHips - firstHips
            diffWaist = latestWaist - firstWaist            
            return [diffWeight,diffWaist,diffHips]
        end
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
        newActivityID = UserDataDbModel.where(IDU:@userID).first.IDA rescue ''
        newActivity = ActivityDbModel.where(id:newActivityID).first rescue ''
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
        newTargetID = UserDataDbModel.where(IDU:@userID).first.IDT rescue ''
        newTarget = TargetDbModel.where(id:newTargetID).first rescue ''
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
            newUserRequisition.IDU = @userID
        end
        newUserRequisition.PPM = ppm
        newUserRequisition.CPM = cpm
        newUserRequisition.Protein = weight*ProteinRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\"").first.Requirement
        newUserRequisition.Carbs = 130
        newUserRequisition.Valine = weight*AminoAcidsRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Valine'").first.Requirement
        newUserRequisition.Isoleucine = weight*AminoAcidsRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Isoleucine'").first.Requirement
        newUserRequisition.Leucine = weight*AminoAcidsRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Leucine'").first.Requirement
        newUserRequisition.Lysine = weight*AminoAcidsRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Lysine'").first.Requirement
        newUserRequisition.Methionine = weight*AminoAcidsRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Methionine'").first.Requirement
        newUserRequisition.Threonine = weight*AminoAcidsRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Threonine'").first.Requirement
        newUserRequisition.Tryptophan = weight*AminoAcidsRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Tryptophan'").first.Requirement
        newUserRequisition.Phenylalanine = weight*AminoAcidsRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Phenylalanine'").first.Requirement
        newUserRequisition.VitA = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitA' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitB1 = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitB1' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitB2 = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitB2' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitB3 = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitB3' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitB4 = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitB4' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitB5 = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitB5' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitB6 = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitB6' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitB9 = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitB9' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitB12 = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitB12' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitC = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitC' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitD = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitD' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitE = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitE' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitH = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitH' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.VitK = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'VitK' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.Cl = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Cl' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.Zn = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Zn' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.F = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'F' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.P = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'P' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.I = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'I' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.Mg = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Mg' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.Cu = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Cu' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.K = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'K' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.Se = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Se' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.Na = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Na' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.Ca = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Ca' and \"IsWoman\" = #{gender}").first.Requirement
        newUserRequisition.Fe = GeneralRequisitionDbModel.where("#{age} >= \"FromAge\" and #{age} <=\"ToAge\" and \"Name\" LIKE 'Fe' and \"IsWoman\" = #{gender}").first.Requirement
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
        if(calories < newUserRequisition.PPM)
            return 'Docelowa dzienna kaloryczność nie może być mniejsza niż Twoja podstawowa przemiana materii'
        elsif ((calories < newUserRequisition.CPM && target == 3) || (calories > newUserRequisition.CPM - 50 && target == 1) || ((newUserRequisition.CPM - 100 >= calories || calories > newUserRequisition.CPM ) && target == 2))
            return 'Podana wartość kalorii nie pozwoli Ci osiągnąć Twojego celu'
        else
            return saveUserRequisition(calories)
        end
    end
    def getUserRequisition
        newUserRequisition = UserRequisitionDbModel.where(IDU:@userID).first
    end
end