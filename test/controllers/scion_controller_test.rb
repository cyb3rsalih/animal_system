require 'test_helper'

class ScionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scion_index_url
    assert_response :success
  end

  test "should get create" do
    get scion_create_url
    assert_response :success
  end

end
