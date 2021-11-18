require 'test_helper'

class IssuedRewardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get issued_rewards_index_url
    assert_response :success
  end

end
