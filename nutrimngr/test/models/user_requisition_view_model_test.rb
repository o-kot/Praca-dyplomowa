require 'test_helper'

class UserRequisitionViewModelTest < ActiveSupport::TestCase
    test "UserRequisitionTest" do
        testUserID = 24
        testUserAge = rand(17..85)
        testUserDataIsWoman = [false,true].sample
        testUserDataHeight = rand(110..210)
        testUserDataTargetID = rand(1..3)
        testUserDataActivityID = rand(1..9)
        testUserMeasurementsWeight = rand(50..150)

        testUserRequisition = UserRequisitionViewModel.new(testUserID)
        targetCalories = testUserRequisition.calculateUserRequisition(testUserDataIsWoman,testUserDataHeight,testUserMeasurementsWeight,testUserDataActivityID,testUserAge,testUserDataTargetID)
        assert targetCalories.is_a?(Integer)  
        assert testUserRequisition.saveUserRequisition(targetCalories) == 'success'

        testUserAge = rand(17..85)
        testUserDataIsWoman = [false,true].sample
        testUserDataHeight = rand(110..210)
        testUserDataTargetID = rand(1..3)
        testUserDataActivityID = rand(1..9)
        testUserMeasurementsWeight = rand(50.1..180.9)
        modifiedTargetCalories = 15

        targetCalories = testUserRequisition.calculateUserRequisition(testUserDataIsWoman,testUserDataHeight,testUserMeasurementsWeight,testUserDataActivityID,testUserAge,testUserDataTargetID)
        assert targetCalories.is_a?(Integer)
        assert testUserRequisition.modifyUserRequisition(modifiedTargetCalories) != 'success'
        modifiedTargetCalories = targetCalories - 1
        assert testUserRequisition.modifyUserRequisition(modifiedTargetCalories) == 'success'
    end
end