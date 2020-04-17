class UserMeasurementsViewModel
    attr_accessor :userMeasurementsWeight, :userMeasurementsWaist, :userMeasurementsHips
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
        @userMeasurementsWeight = measurements.Weight rescue ''
        @userMeasurementsWaist = measurements.Waist rescue ''
        @userMeasurementsHips = measurements.Hips rescue ''
    end
end