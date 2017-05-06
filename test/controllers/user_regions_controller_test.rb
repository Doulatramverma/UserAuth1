require 'test_helper'

class UserRegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_region = user_regions(:one)
  end

  test "should get index" do
    get user_regions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_region_url
    assert_response :success
  end

  test "should create user_region" do
    assert_difference('UserRegion.count') do
      post user_regions_url, params: { user_region: { region_id: @user_region.region_id, user_id: @user_region.user_id } }
    end

    assert_redirected_to user_region_url(UserRegion.last)
  end

  test "should show user_region" do
    get user_region_url(@user_region)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_region_url(@user_region)
    assert_response :success
  end

  test "should update user_region" do
    patch user_region_url(@user_region), params: { user_region: { region_id: @user_region.region_id, user_id: @user_region.user_id } }
    assert_redirected_to user_region_url(@user_region)
  end

  test "should destroy user_region" do
    assert_difference('UserRegion.count', -1) do
      delete user_region_url(@user_region)
    end

    assert_redirected_to user_regions_url
  end
end
