require 'test_helper'

class ProfessorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get professors_new_url
    assert_response :success
  end

end
