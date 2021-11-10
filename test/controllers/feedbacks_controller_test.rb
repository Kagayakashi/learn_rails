require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feedbacks_index_url
    assert_response :success
  end

end
