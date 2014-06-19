require 'test_helper'

class ClinicalsectionsControllerTest < ActionController::TestCase
  setup do
    @clinicalsection = clinicalsections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clinicalsections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clinicalsection" do
    assert_difference('Clinicalsection.count') do
      post :create, clinicalsection: { sectionname: @clinicalsection.sectionname }
    end

    assert_redirected_to clinicalsection_path(assigns(:clinicalsection))
  end

  test "should show clinicalsection" do
    get :show, id: @clinicalsection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clinicalsection
    assert_response :success
  end

  test "should update clinicalsection" do
    put :update, id: @clinicalsection, clinicalsection: { sectionname: @clinicalsection.sectionname }
    assert_redirected_to clinicalsection_path(assigns(:clinicalsection))
  end

  test "should destroy clinicalsection" do
    assert_difference('Clinicalsection.count', -1) do
      delete :destroy, id: @clinicalsection
    end

    assert_redirected_to clinicalsections_path
  end
end
