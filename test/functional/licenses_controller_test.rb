require 'test_helper'

class LicensesControllerTest < ActionController::TestCase
  setup do
    @license = licenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create license" do
    assert_difference('License.count') do
      post :create, license: { affiliate_id: @license.affiliate_id, licensenumber: @license.licensenumber, state: @license.state, status: @license.status, year: @license.year }
    end

    assert_redirected_to license_path(assigns(:license))
  end

  test "should show license" do
    get :show, id: @license
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @license
    assert_response :success
  end

  test "should update license" do
    put :update, id: @license, license: { affiliate_id: @license.affiliate_id, licensenumber: @license.licensenumber, state: @license.state, status: @license.status, year: @license.year }
    assert_redirected_to license_path(assigns(:license))
  end

  test "should destroy license" do
    assert_difference('License.count', -1) do
      delete :destroy, id: @license
    end

    assert_redirected_to licenses_path
  end
end
