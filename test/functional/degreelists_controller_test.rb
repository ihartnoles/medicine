require 'test_helper'

class DegreelistsControllerTest < ActionController::TestCase
  setup do
    @degreelist = degreelists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:degreelists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create degreelist" do
    assert_difference('Degreelist.count') do
      post :create, degreelist: { degreename: @degreelist.degreename }
    end

    assert_redirected_to degreelist_path(assigns(:degreelist))
  end

  test "should show degreelist" do
    get :show, id: @degreelist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @degreelist
    assert_response :success
  end

  test "should update degreelist" do
    put :update, id: @degreelist, degreelist: { degreename: @degreelist.degreename }
    assert_redirected_to degreelist_path(assigns(:degreelist))
  end

  test "should destroy degreelist" do
    assert_difference('Degreelist.count', -1) do
      delete :destroy, id: @degreelist
    end

    assert_redirected_to degreelists_path
  end
end
