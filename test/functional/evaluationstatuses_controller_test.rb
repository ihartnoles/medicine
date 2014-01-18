require 'test_helper'

class EvaluationstatusesControllerTest < ActionController::TestCase
  setup do
    @evaluationstatus = evaluationstatuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluationstatuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluationstatus" do
    assert_difference('Evaluationstatus.count') do
      post :create, evaluationstatus: { status: @evaluationstatus.status }
    end

    assert_redirected_to evaluationstatus_path(assigns(:evaluationstatus))
  end

  test "should show evaluationstatus" do
    get :show, id: @evaluationstatus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluationstatus
    assert_response :success
  end

  test "should update evaluationstatus" do
    put :update, id: @evaluationstatus, evaluationstatus: { status: @evaluationstatus.status }
    assert_redirected_to evaluationstatus_path(assigns(:evaluationstatus))
  end

  test "should destroy evaluationstatus" do
    assert_difference('Evaluationstatus.count', -1) do
      delete :destroy, id: @evaluationstatus
    end

    assert_redirected_to evaluationstatuses_path
  end
end
