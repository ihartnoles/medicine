require 'test_helper'

class FacultytitlesControllerTest < ActionController::TestCase
  setup do
    @facultytitle = facultytitles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facultytitles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facultytitle" do
    assert_difference('Facultytitle.count') do
      post :create, facultytitle: { title: @facultytitle.title }
    end

    assert_redirected_to facultytitle_path(assigns(:facultytitle))
  end

  test "should show facultytitle" do
    get :show, id: @facultytitle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facultytitle
    assert_response :success
  end

  test "should update facultytitle" do
    put :update, id: @facultytitle, facultytitle: { title: @facultytitle.title }
    assert_redirected_to facultytitle_path(assigns(:facultytitle))
  end

  test "should destroy facultytitle" do
    assert_difference('Facultytitle.count', -1) do
      delete :destroy, id: @facultytitle
    end

    assert_redirected_to facultytitles_path
  end
end
