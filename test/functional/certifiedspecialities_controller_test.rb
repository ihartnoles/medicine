require 'test_helper'

class CertifiedspecialitiesControllerTest < ActionController::TestCase
  setup do
    @certifiedspeciality = certifiedspecialities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certifiedspecialities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certifiedspeciality" do
    assert_difference('Certifiedspeciality.count') do
      post :create, certifiedspeciality: { affiliate_id: @certifiedspeciality.affiliate_id, speciality_id: @certifiedspeciality.speciality_id, year: @certifiedspeciality.year }
    end

    assert_redirected_to certifiedspeciality_path(assigns(:certifiedspeciality))
  end

  test "should show certifiedspeciality" do
    get :show, id: @certifiedspeciality
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @certifiedspeciality
    assert_response :success
  end

  test "should update certifiedspeciality" do
    put :update, id: @certifiedspeciality, certifiedspeciality: { affiliate_id: @certifiedspeciality.affiliate_id, speciality_id: @certifiedspeciality.speciality_id, year: @certifiedspeciality.year }
    assert_redirected_to certifiedspeciality_path(assigns(:certifiedspeciality))
  end

  test "should destroy certifiedspeciality" do
    assert_difference('Certifiedspeciality.count', -1) do
      delete :destroy, id: @certifiedspeciality
    end

    assert_redirected_to certifiedspecialities_path
  end
end
