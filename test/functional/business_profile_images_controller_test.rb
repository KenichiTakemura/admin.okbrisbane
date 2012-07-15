require 'test_helper'

class BusinessProfileImagesControllerTest < ActionController::TestCase
  setup do
    @business_profile_image = business_profile_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_profile_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_profile_image" do
    assert_difference('BusinessProfileImage.count') do
      post :create, business_profile_image: {  }
    end

    assert_redirected_to business_profile_image_path(assigns(:business_profile_image))
  end

  test "should show business_profile_image" do
    get :show, id: @business_profile_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_profile_image
    assert_response :success
  end

  test "should update business_profile_image" do
    put :update, id: @business_profile_image, business_profile_image: {  }
    assert_redirected_to business_profile_image_path(assigns(:business_profile_image))
  end

  test "should destroy business_profile_image" do
    assert_difference('BusinessProfileImage.count', -1) do
      delete :destroy, id: @business_profile_image
    end

    assert_redirected_to business_profile_images_path
  end
end
