require 'test_helper'

class SalesManagementsControllerTest < ActionController::TestCase
  setup do
    @sales_management = sales_managements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_managements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_management" do
    assert_difference('SalesManagement.count') do
      post :create, sales_management: {  }
    end

    assert_redirected_to sales_management_path(assigns(:sales_management))
  end

  test "should show sales_management" do
    get :show, id: @sales_management
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_management
    assert_response :success
  end

  test "should update sales_management" do
    put :update, id: @sales_management, sales_management: {  }
    assert_redirected_to sales_management_path(assigns(:sales_management))
  end

  test "should destroy sales_management" do
    assert_difference('SalesManagement.count', -1) do
      delete :destroy, id: @sales_management
    end

    assert_redirected_to sales_managements_path
  end
end
