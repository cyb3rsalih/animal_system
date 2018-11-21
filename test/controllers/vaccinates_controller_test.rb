require 'test_helper'

class VaccinatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vaccinates_new_url
    assert_response :success
  end

  test "should get show" do
    get vaccinates_show_url
    assert_response :success
  end

end
