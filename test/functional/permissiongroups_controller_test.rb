require 'test_helper'

class PermissiongroupsControllerTest < ActionController::TestCase
  setup do
    @permissiongroup = permissiongroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:permissiongroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create permissiongroup" do
    assert_difference('Permissiongroup.count') do
      post :create, permissiongroup: {  }
    end

    assert_redirected_to permissiongroup_path(assigns(:permissiongroup))
  end

  test "should show permissiongroup" do
    get :show, id: @permissiongroup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @permissiongroup
    assert_response :success
  end

  test "should update permissiongroup" do
    put :update, id: @permissiongroup, permissiongroup: {  }
    assert_redirected_to permissiongroup_path(assigns(:permissiongroup))
  end

  test "should destroy permissiongroup" do
    assert_difference('Permissiongroup.count', -1) do
      delete :destroy, id: @permissiongroup
    end

    assert_redirected_to permissiongroups_path
  end
end
