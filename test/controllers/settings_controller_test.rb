require 'test_helper'
require 'simplecov'

class CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get settings_path
    assert_response :success
  end
end