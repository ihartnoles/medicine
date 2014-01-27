require 'test_helper'

class DisciplinaryactionsControllerTest < ActionController::TestCase
  setup do
    @disciplinaryaction = disciplinaryactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disciplinaryactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disciplinaryaction" do
    assert_difference('Disciplinaryaction.count') do
      post :create, disciplinaryaction: { affiliate_id: @disciplinaryaction.affiliate_id, date: @disciplinaryaction.date, disciplinaryaction: @disciplinaryaction.disciplinaryaction, removed: @disciplinaryaction.removed }
    end

    assert_redirected_to disciplinaryaction_path(assigns(:disciplinaryaction))
  end

  test "should show disciplinaryaction" do
    get :show, id: @disciplinaryaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disciplinaryaction
    assert_response :success
  end

  test "should update disciplinaryaction" do
    put :update, id: @disciplinaryaction, disciplinaryaction: { affiliate_id: @disciplinaryaction.affiliate_id, date: @disciplinaryaction.date, disciplinaryaction: @disciplinaryaction.disciplinaryaction, removed: @disciplinaryaction.removed }
    assert_redirected_to disciplinaryaction_path(assigns(:disciplinaryaction))
  end

  test "should destroy disciplinaryaction" do
    assert_difference('Disciplinaryaction.count', -1) do
      delete :destroy, id: @disciplinaryaction
    end

    assert_redirected_to disciplinaryactions_path
  end
end
