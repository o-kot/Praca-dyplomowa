class UserMeasurementsViewModel
    attr_accessor :userMeasurementsWeight
    def initialize(id)
        @userID = id
    end
    def saveUserMeasurements(weight,waist,hips)  
        measurements = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        measurements.saveUserMeasurements
    end
    def editUserMeasurement(id)
        measurement = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        measurement.editUserMeasurement
    end
    def getUserMeasurements
        measurements = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID).getUserMeasurements
        userMeasurementsWeight = measurements.Weight rescue ''
        userMeasurementsWaist = measurements.Waist rescue ''
        userMeasurementsHips = measurements.Hips rescue ''
    end
    userMeasurementsWaist = ''
    userMeasurementsHips = ''
    private
    @userID = -1
end