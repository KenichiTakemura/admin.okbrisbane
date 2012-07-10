require 'test_helper'

class BusinessClientsControllerTest < ActionController::TestCase
  setup do
    @business_client = business_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_client" do
    assert_difference('BusinessClient.count') do
      post :create, business_client: {  }
    end

    assert_redirected_to business_client_path(assigns(:business_client))
  end

  test "should show business_client" do
    get :show, id: @business_client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_client
    assert_response :success
  end

  test "should update business_client" do
    put :update, id: @business_client, business_client: {  }
    assert_redirected_to business_client_path(assigns(:business_client))
  end

  test "should destroy business_client" do
    assert_difference('BusinessClient.count', -1) do
      delete :destroy, id: @business_client
    end

    assert_redirected_to business_clients_path
  end
end
