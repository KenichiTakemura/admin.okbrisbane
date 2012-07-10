require 'test_helper'

class ClientImagesControllerTest < ActionController::TestCase
  setup do
    @client_image = client_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_image" do
    assert_difference('ClientImage.count') do
      post :create, client_image: {  }
    end

    assert_redirected_to client_image_path(assigns(:client_image))
  end

  test "should show client_image" do
    get :show, id: @client_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_image
    assert_response :success
  end

  test "should update client_image" do
    put :update, id: @client_image, client_image: {  }
    assert_redirected_to client_image_path(assigns(:client_image))
  end

  test "should destroy client_image" do
    assert_difference('ClientImage.count', -1) do
      delete :destroy, id: @client_image
    end

    assert_redirected_to client_images_path
  end
end
