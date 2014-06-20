require 'test_helper'

class AppointmentDatesControllerTest < ActionController::TestCase
  setup do
    @appointment_date = appointment_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointment_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointment_date" do
    assert_difference('AppointmentDate.count') do
      post :create, appointment_date: { affiliate_id: @appointment_date.affiliate_id, com_start_date: @appointment_date.com_start_date }
    end

    assert_redirected_to appointment_date_path(assigns(:appointment_date))
  end

  test "should show appointment_date" do
    get :show, id: @appointment_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointment_date
    assert_response :success
  end

  test "should update appointment_date" do
    put :update, id: @appointment_date, appointment_date: { affiliate_id: @appointment_date.affiliate_id, com_start_date: @appointment_date.com_start_date }
    assert_redirected_to appointment_date_path(assigns(:appointment_date))
  end

  test "should destroy appointment_date" do
    assert_difference('AppointmentDate.count', -1) do
      delete :destroy, id: @appointment_date
    end

    assert_redirected_to appointment_dates_path
  end
end
