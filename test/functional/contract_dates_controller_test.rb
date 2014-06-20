require 'test_helper'

class ContractDatesControllerTest < ActionController::TestCase
  setup do
    @contract_date = contract_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_date" do
    assert_difference('ContractDate.count') do
      post :create, contract_date: { affiliate_id: @contract_date.affiliate_id, grad_college_end_date: @contract_date.grad_college_end_date, grad_college_start_date: @contract_date.grad_college_start_date }
    end

    assert_redirected_to contract_date_path(assigns(:contract_date))
  end

  test "should show contract_date" do
    get :show, id: @contract_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract_date
    assert_response :success
  end

  test "should update contract_date" do
    put :update, id: @contract_date, contract_date: { affiliate_id: @contract_date.affiliate_id, grad_college_end_date: @contract_date.grad_college_end_date, grad_college_start_date: @contract_date.grad_college_start_date }
    assert_redirected_to contract_date_path(assigns(:contract_date))
  end

  test "should destroy contract_date" do
    assert_difference('ContractDate.count', -1) do
      delete :destroy, id: @contract_date
    end

    assert_redirected_to contract_dates_path
  end
end
