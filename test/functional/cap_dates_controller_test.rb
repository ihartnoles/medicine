require 'test_helper'

class CapDatesControllerTest < ActionController::TestCase
  setup do
    @cap_date = cap_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cap_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cap_date" do
    assert_difference('CapDate.count') do
      post :create, cap_date: { affiliate_id: @cap_date.affiliate_id, certificatedate: @cap_date.certificatedate, meetingdate: @cap_date.meetingdate, statusdate: @cap_date.statusdate }
    end

    assert_redirected_to cap_date_path(assigns(:cap_date))
  end

  test "should show cap_date" do
    get :show, id: @cap_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cap_date
    assert_response :success
  end

  test "should update cap_date" do
    put :update, id: @cap_date, cap_date: { affiliate_id: @cap_date.affiliate_id, certificatedate: @cap_date.certificatedate, meetingdate: @cap_date.meetingdate, statusdate: @cap_date.statusdate }
    assert_redirected_to cap_date_path(assigns(:cap_date))
  end

  test "should destroy cap_date" do
    assert_difference('CapDate.count', -1) do
      delete :destroy, id: @cap_date
    end

    assert_redirected_to cap_dates_path
  end
end
