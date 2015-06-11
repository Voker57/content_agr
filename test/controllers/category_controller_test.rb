require 'test_helper'

class CategoryControllerTest < ActionController::TestCase
  test "should get world" do
    get :world
    assert_response :success
  end

  test "should get russian" do
    get :russian
    assert_response :success
  end

  test "should get social" do
    get :social
    assert_response :success
  end

  test "should get political" do
    get :political
    assert_response :success
  end

  test "should get buseness" do
    get :buseness
    assert_response :success
  end

  test "should get science" do
    get :science
    assert_response :success
  end

  test "should get sport" do
    get :sport
    assert_response :success
  end

end
