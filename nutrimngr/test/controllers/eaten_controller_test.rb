require 'test_helper'

class EatenControllerTest < ActionDispatch::IntegrationTest
    test "EatenControllerTest" do
        testUserID = 24

        params = {}
        params['meal'] = rand(1..6).to_s
        params['date'] = Date.today
        params['time'] = Time.now.to_s(:time)

        post "/addMeal", params: params
        assert @response.body == 'Choose how'

        params = {}
        params['meal'] = 0
        params['date'] = Date.today
        params['time'] = Time.now.to_s(:time)
        params['session'] = session

        post "/addMeal", params: params
        assert @response.body == 'Nie wybrano posiłku.'
    end
end