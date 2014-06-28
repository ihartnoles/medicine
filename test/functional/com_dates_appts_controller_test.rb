require 'test_helper'

class ComDatesApptsControllerTest < ActionController::TestCase
  setup do
    @com_dates_appt = com_dates_appts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:com_dates_appts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create com_dates_appt" do
    assert_difference('ComDatesAppt.count') do
      post :create, com_dates_appt: { academic_start_date: @com_dates_appt.academic_start_date, academic_title: @com_dates_appt.academic_title, admin1_end_date: @com_dates_appt.admin1_end_date, admin1_start_date: @com_dates_appt.admin1_start_date, admin1_title: @com_dates_appt.admin1_title, admin2_end_date: @com_dates_appt.admin2_end_date, admin2_start_date: @com_dates_appt.admin2_start_date, admin2_title: @com_dates_appt.admin2_title, admin3_end_date: @com_dates_appt.admin3_end_date, admin3_start_date: @com_dates_appt.admin3_start_date, admin3_title: @com_dates_appt.admin3_title, position_end_date: @com_dates_appt.position_end_date, position_end_date: @com_dates_appt.position_end_date, position_start_date: @com_dates_appt.position_start_date, position_title: @com_dates_appt.position_title, positiontrack: @com_dates_appt.positiontrack, workingtitle: @com_dates_appt.workingtitle }
    end

    assert_redirected_to com_dates_appt_path(assigns(:com_dates_appt))
  end

  test "should show com_dates_appt" do
    get :show, id: @com_dates_appt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @com_dates_appt
    assert_response :success
  end

  test "should update com_dates_appt" do
    put :update, id: @com_dates_appt, com_dates_appt: { academic_start_date: @com_dates_appt.academic_start_date, academic_title: @com_dates_appt.academic_title, admin1_end_date: @com_dates_appt.admin1_end_date, admin1_start_date: @com_dates_appt.admin1_start_date, admin1_title: @com_dates_appt.admin1_title, admin2_end_date: @com_dates_appt.admin2_end_date, admin2_start_date: @com_dates_appt.admin2_start_date, admin2_title: @com_dates_appt.admin2_title, admin3_end_date: @com_dates_appt.admin3_end_date, admin3_start_date: @com_dates_appt.admin3_start_date, admin3_title: @com_dates_appt.admin3_title, position_end_date: @com_dates_appt.position_end_date, position_end_date: @com_dates_appt.position_end_date, position_start_date: @com_dates_appt.position_start_date, position_title: @com_dates_appt.position_title, positiontrack: @com_dates_appt.positiontrack, workingtitle: @com_dates_appt.workingtitle }
    assert_redirected_to com_dates_appt_path(assigns(:com_dates_appt))
  end

  test "should destroy com_dates_appt" do
    assert_difference('ComDatesAppt.count', -1) do
      delete :destroy, id: @com_dates_appt
    end

    assert_redirected_to com_dates_appts_path
  end
end
