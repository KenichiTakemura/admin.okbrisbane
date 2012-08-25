require 'test_helper'

class BannersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admins(:admin1)
    @pages = Style.banner_pages
    Style.create_banners
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_nil assigns(:banners)
    Style.banner_pages.each do |key,value|
      get(:index, {"page_id" => Style.pageid_key(key)})
      assert_response :success
      assert assigns(:banners), "Not assigned page: #{value} page_id: #{Style.pageid_key(key)}"
    end
  end

  #test "should not get new" do
  #  get :new
  #  assert_response :errors
  #end

  # test "should create banner" do
    # assert_difference('Banner.count') do
      # post :create, banner: {  }
    # end
# 
    # assert_redirected_to banner_path(assigns(:banner))
  # end
# 
  # test "should show banner" do
    # get :show, id: @banner
    # assert_response :success
  # end
# 
  # test "should get edit" do
    # get :edit, id: @banner
    # assert_response :success
  # end
# 
  # test "should update banner" do
    # put :update, id: @banner, banner: {  }
    # assert_redirected_to banner_path(assigns(:banner))
  # end
# 
  # test "should destroy banner" do
    # assert_difference('Banner.count', -1) do
      # delete :destroy, id: @banner
    # end
# 
    # assert_redirected_to banners_path
  # end
end
