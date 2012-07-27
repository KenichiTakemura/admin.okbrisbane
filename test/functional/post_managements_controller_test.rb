require 'test_helper'

class PostManagementsControllerTest < ActionController::TestCase
  setup do
    @post_management = post_managements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_managements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_management" do
    assert_difference('PostManagement.count') do
      post :create, post_management: {  }
    end

    assert_redirected_to post_management_path(assigns(:post_management))
  end

  test "should show post_management" do
    get :show, id: @post_management
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_management
    assert_response :success
  end

  test "should update post_management" do
    put :update, id: @post_management, post_management: {  }
    assert_redirected_to post_management_path(assigns(:post_management))
  end

  test "should destroy post_management" do
    assert_difference('PostManagement.count', -1) do
      delete :destroy, id: @post_management
    end

    assert_redirected_to post_managements_path
  end
end
