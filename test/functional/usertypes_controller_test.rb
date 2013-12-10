require 'test_helper'

class UsertypesControllerTest < ActionController::TestCase
  setup do
    @usertype = usertypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usertypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usertype" do
    assert_difference('Usertype.count') do
      post :create, usertype: { description: @usertype.description, usertype: @usertype.usertype }
    end

    assert_redirected_to usertype_path(assigns(:usertype))
  end

  test "should show usertype" do
    get :show, id: @usertype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usertype
    assert_response :success
  end

  test "should update usertype" do
    put :update, id: @usertype, usertype: { description: @usertype.description, usertype: @usertype.usertype }
    assert_redirected_to usertype_path(assigns(:usertype))
  end

  test "should destroy usertype" do
    assert_difference('Usertype.count', -1) do
      delete :destroy, id: @usertype
    end

    assert_redirected_to usertypes_path
  end
end
