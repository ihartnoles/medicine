require 'test_helper'

class BannerqueuesControllerTest < ActionController::TestCase
  setup do
    @bannerqueue = bannerqueues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bannerqueues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bannerqueue" do
    assert_difference('Bannerqueue.count') do
      post :create, bannerqueue: { dob: @bannerqueue.dob, emailfau: @bannerqueue.emailfau, faunetid: @bannerqueue.faunetid, firstname: @bannerqueue.firstname, homecity: @bannerqueue.homecity, homestate: @bannerqueue.homestate, homestreet: @bannerqueue.homestreet, homezip: @bannerqueue.homezip, lastname: @bannerqueue.lastname, suffix: @bannerqueue.suffix, znumber: @bannerqueue.znumber }
    end

    assert_redirected_to bannerqueue_path(assigns(:bannerqueue))
  end

  test "should show bannerqueue" do
    get :show, id: @bannerqueue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bannerqueue
    assert_response :success
  end

  test "should update bannerqueue" do
    put :update, id: @bannerqueue, bannerqueue: { dob: @bannerqueue.dob, emailfau: @bannerqueue.emailfau, faunetid: @bannerqueue.faunetid, firstname: @bannerqueue.firstname, homecity: @bannerqueue.homecity, homestate: @bannerqueue.homestate, homestreet: @bannerqueue.homestreet, homezip: @bannerqueue.homezip, lastname: @bannerqueue.lastname, suffix: @bannerqueue.suffix, znumber: @bannerqueue.znumber }
    assert_redirected_to bannerqueue_path(assigns(:bannerqueue))
  end

  test "should destroy bannerqueue" do
    assert_difference('Bannerqueue.count', -1) do
      delete :destroy, id: @bannerqueue
    end

    assert_redirected_to bannerqueues_path
  end
end
