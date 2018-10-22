require 'test_helper'

class AnimalControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get animal_show_url
    assert_response :success
  end

  test "should get new" do
    get animal_new_url
    assert_response :success
  end

  test "should get index" do
    get animal_index_url
    assert_response :success
  end

end
