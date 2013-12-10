require 'test_helper'

class AffiliateresearchareasControllerTest < ActionController::TestCase
  setup do
    @affiliateresearcharea = affiliateresearchareas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affiliateresearchareas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affiliateresearcharea" do
    assert_difference('Affiliateresearcharea.count') do
      post :create, affiliateresearcharea: { affiliate_id: @affiliateresearcharea.affiliate_id, researcharea_id: @affiliateresearcharea.researcharea_id }
    end

    assert_redirected_to affiliateresearcharea_path(assigns(:affiliateresearcharea))
  end

  test "should show affiliateresearcharea" do
    get :show, id: @affiliateresearcharea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @affiliateresearcharea
    assert_response :success
  end

  test "should update affiliateresearcharea" do
    put :update, id: @affiliateresearcharea, affiliateresearcharea: { affiliate_id: @affiliateresearcharea.affiliate_id, researcharea_id: @affiliateresearcharea.researcharea_id }
    assert_redirected_to affiliateresearcharea_path(assigns(:affiliateresearcharea))
  end

  test "should destroy affiliateresearcharea" do
    assert_difference('Affiliateresearcharea.count', -1) do
      delete :destroy, id: @affiliateresearcharea
    end

    assert_redirected_to affiliateresearchareas_path
  end
end
