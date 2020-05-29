class UserMeasurementsViewModel
    attr_accessor :userMeasurementsWeight, :userMeasurementsWaist, :userMeasurementsHips, :getUserMeasurementsDate
    def initialize(id)
        @userID = id
    end
    def saveUserMeasurements(weight,waist,hips)  
        measurements = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        measurements.saveUserMeasurements(weight,waist,hips)  
    end
    def editUserMeasurement(what,edited)
        measurement = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        measurement.editUserMeasurement(what,edited)
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

    end
end