require 'test_helper'

class BusinessCategoriesControllerTest < ActionController::TestCase
  setup do
    @business_category = business_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_category" do
    assert_difference('BusinessCategory.count') do
      post :create, business_category: {  }
    end

    assert_redirected_to business_category_path(assigns(:business_category))
  end

  test "should show business_category" do
    get :show, id: @business_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_category
    assert_response :success
  end

  test "should update business_category" do
    put :update, id: @business_category, business_category: {  }
    assert_redirected_to business_category_path(assigns(:business_category))
  end

  test "should destroy business_category" do
    assert_difference('BusinessCategory.count', -1) do
      delete :destroy, id: @business_category
    end

    assert_redirected_to business_categories_path
  end
end
