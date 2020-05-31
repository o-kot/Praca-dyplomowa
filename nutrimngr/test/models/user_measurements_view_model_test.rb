require 'test_helper'

class UserMeasurementsViewModelTest < ActiveSupport::TestCase
    test "UserMeasurementTest" do
        testWhat = rand(1..3)
        testValue = rand(60.1..150.99)
        testUserID = 24
        testMeasurement = UserMeasurementsViewModel.new(testUserID)

        assert testMeasurement.addNewMeasurement(testWhat,testValue) == 'success'
    end
end