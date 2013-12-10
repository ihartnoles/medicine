require 'test_helper'

class DegreesControllerTest < ActionController::TestCase
  setup do
    @degree = degrees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:degrees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create degree" do
    assert_difference('Degree.count') do
      post :create, degree: { affiliate_id: @degree.affiliate_id, degreename: @degree.degreename, institution_id: @degree.institution_id, year: @degree.year }
    end

    assert_redirected_to degree_path(assigns(:degree))
  end

  test "should show degree" do
    get :show, id: @degree
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @degree
    assert_response :success
  end

  test "should update degree" do
    put :update, id: @degree, degree: { affiliate_id: @degree.affiliate_id, degreename: @degree.degreename, institution_id: @degree.institution_id, year: @degree.year }
    assert_redirected_to degree_path(assigns(:degree))
  end

  test "should destroy degree" do
    assert_difference('Degree.count', -1) do
      delete :destroy, id: @degree
    end

    assert_redirected_to degrees_path
  end
end
