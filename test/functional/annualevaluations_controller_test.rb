require 'test_helper'

class AnnualevaluationsControllerTest < ActionController::TestCase
  setup do
    @annualevaluation = annualevaluations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:annualevaluations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create annualevaluation" do
    assert_difference('Annualevaluation.count') do
      post :create, annualevaluation: { completeddate: @annualevaluation.completeddate, duedate: @annualevaluation.duedate, evaluator_id: @annualevaluation.evaluator_id, status_id: @annualevaluation.status_id }
    end

    assert_redirected_to annualevaluation_path(assigns(:annualevaluation))
  end

  test "should show annualevaluation" do
    get :show, id: @annualevaluation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @annualevaluation
    assert_response :success
  end

  test "should update annualevaluation" do
    put :update, id: @annualevaluation, annualevaluation: { completeddate: @annualevaluation.completeddate, duedate: @annualevaluation.duedate, evaluator_id: @annualevaluation.evaluator_id, status_id: @annualevaluation.status_id }
    assert_redirected_to annualevaluation_path(assigns(:annualevaluation))
  end

  test "should destroy annualevaluation" do
    assert_difference('Annualevaluation.count', -1) do
      delete :destroy, id: @annualevaluation
    end

    assert_redirected_to annualevaluations_path
  end
end
