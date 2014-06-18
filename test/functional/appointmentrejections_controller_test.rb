require 'test_helper'

class AppointmentrejectionsControllerTest < ActionController::TestCase
  setup do
    @appointmentrejection = appointmentrejections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointmentrejections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointmentrejection" do
    assert_difference('Appointmentrejection.count') do
      post :create, appointmentrejection: { date: @appointmentrejection.date, status: @appointmentrejection.status, vetter: @appointmentrejection.vetter }
    end

    assert_redirected_to appointmentrejection_path(assigns(:appointmentrejection))
  end

  test "should show appointmentrejection" do
    get :show, id: @appointmentrejection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointmentrejection
    assert_response :success
  end

  test "should update appointmentrejection" do
    put :update, id: @appointmentrejection, appointmentrejection: { date: @appointmentrejection.date, status: @appointmentrejection.status, vetter: @appointmentrejection.vetter }
    assert_redirected_to appointmentrejection_path(assigns(:appointmentrejection))
  end

  test "should destroy appointmentrejection" do
    assert_difference('Appointmentrejection.count', -1) do
      delete :destroy, id: @appointmentrejection
    end

    assert_redirected_to appointmentrejections_path
  end
end
