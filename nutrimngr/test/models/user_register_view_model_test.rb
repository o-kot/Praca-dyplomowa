require 'test_helper'

class UserRegisterViewModelTest < ActiveSupport::TestCase
    test "UserRegisterTest" do
        testUserLogin = "user#{Time.now.to_i}@test.pl"
        testUser = UserRegisterViewModel.new
        assert testUser.saveUser(testUserLogin,'Testy123!@#') == 'success'
        assert testUser.saveUser(testUserLogin,'Testy123!@#') != 'success'
    end
end