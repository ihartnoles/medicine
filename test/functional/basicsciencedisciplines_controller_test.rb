require 'test_helper'

class BasicsciencedisciplinesControllerTest < ActionController::TestCase
  setup do
    @basicsciencediscipline = basicsciencedisciplines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basicsciencedisciplines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basicsciencediscipline" do
    assert_difference('Basicsciencediscipline.count') do
      post :create, basicsciencediscipline: { discipline_id: @basicsciencediscipline.discipline_id, disciplinename: @basicsciencediscipline.disciplinename }
    end

    assert_redirected_to basicsciencediscipline_path(assigns(:basicsciencediscipline))
  end

  test "should show basicsciencediscipline" do
    get :show, id: @basicsciencediscipline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basicsciencediscipline
    assert_response :success
  end

  test "should update basicsciencediscipline" do
    put :update, id: @basicsciencediscipline, basicsciencediscipline: { discipline_id: @basicsciencediscipline.discipline_id, disciplinename: @basicsciencediscipline.disciplinename }
    assert_redirected_to basicsciencediscipline_path(assigns(:basicsciencediscipline))
  end

  test "should destroy basicsciencediscipline" do
    assert_difference('Basicsciencediscipline.count', -1) do
      delete :destroy, id: @basicsciencediscipline
    end

    assert_redirected_to basicsciencedisciplines_path
  end
end
