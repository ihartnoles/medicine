require 'test_helper'

class FacultyDatesControllerTest < ActionController::TestCase
  setup do
    @faculty_date = faculty_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faculty_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faculty_date" do
    assert_difference('FacultyDate.count') do
      post :create, faculty_date: { overloadend: @faculty_date.overloadend, overloadstart: @faculty_date.overloadstart }
    end

    assert_redirected_to faculty_date_path(assigns(:faculty_date))
  end

  test "should show faculty_date" do
    get :show, id: @faculty_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faculty_date
    assert_response :success
  end

  test "should update faculty_date" do
    put :update, id: @faculty_date, faculty_date: { overloadend: @faculty_date.overloadend, overloadstart: @faculty_date.overloadstart }
    assert_redirected_to faculty_date_path(assigns(:faculty_date))
  end

  test "should destroy faculty_date" do
    assert_difference('FacultyDate.count', -1) do
      delete :destroy, id: @faculty_date
    end

    assert_redirected_to faculty_dates_path
  end
end
