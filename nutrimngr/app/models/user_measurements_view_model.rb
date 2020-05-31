class UserMeasurementsViewModel
    attr_accessor :userMeasurementsWeight, :userMeasurementsWaist, :userMeasurementsHips, :getUserMeasurementsDate
    def initialize(id)
        @userID = id
    end
    def saveUserMeasurements(weight,waist,hips)  
        measurements = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        measurements.saveUserMeasurements(weight,waist,hips)  
    end
    def addNewMeasurement(what,value)
        measurement = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        measurement.addNewMeasurement(what,value)
    end
    def editUserMeasurement(id,what,edited)
        measurement = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        measurement.editUserMeasurement(id,what,edited)
    end
    def deleteUserMeasurement(id,what)
        measurement = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        measurement.deleteUserMeasurement(id,what)
    end
    def getUserMeasurements
        measurements = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID).getUserMeasurements
    end
    def getLatestMeasurements
        measurements = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID).getLatestMeasurements
        @userMeasurementsWeight = measurements[0] rescue ''
        @userMeasurementsWaist = measurements[2] rescue ''
        @userMeasurementsHips = measurements[1] rescue ''
    end    
    def calculateDifference
        differences = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID).calculateDifference
    end
end