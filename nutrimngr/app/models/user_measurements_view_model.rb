class UserMeasuremetsViewModel
    def saveUserMeasurements(weight,waist,hips)  
        measurements = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        measurements.saveUserMeasurements()      
    end
    def editUserMeasurement(id)
        measurement = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        measurement.editUserMeasurement()
    end
    def
        getUserMeasurements()
        measurements = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        measurements.getUserMeasurements()
    end
    $userMeasurementsWeight = ''
    $userMeasurementsWaist = ''
    $userMeasurementsHips = ''
    private
    @userMeasurementsID = ''
    @userMeasurementsUserID = ''
end