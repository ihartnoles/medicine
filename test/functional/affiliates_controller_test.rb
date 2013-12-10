require 'test_helper'

class AffiliatesControllerTest < ActionController::TestCase
  setup do
    @affiliate = affiliates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affiliates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affiliate" do
    assert_difference('Affiliate.count') do
      post :create, affiliate: { cellphone: @affiliate.cellphone, emailfau: @affiliate.emailfau, emailoffice: @affiliate.emailoffice, emailother: @affiliate.emailother, emailpersonal: @affiliate.emailpersonal, emergencyphone: @affiliate.emergencyphone, faxnumber: @affiliate.faxnumber, firstname: @affiliate.firstname, homecity: @affiliate.homecity, homephone: @affiliate.homephone, homestate: @affiliate.homestate, homestreet: @affiliate.homestreet, homezip: @affiliate.homezip, isfaculty: @affiliate.isfaculty, lastname: @affiliate.lastname, license: @affiliate.license, middlename: @affiliate.middlename, officecity: @affiliate.officecity, officestate: @affiliate.officestate, officestreet: @affiliate.officestreet, officezip: @affiliate.officezip, otherphonenumber: @affiliate.otherphonenumber, prefix: @affiliate.prefix, suffix: @affiliate.suffix, znumber: @affiliate.znumber }
    end

    assert_redirected_to affiliate_path(assigns(:affiliate))
  end

  test "should show affiliate" do
    get :show, id: @affiliate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @affiliate
    assert_response :success
  end

  test "should update affiliate" do
    put :update, id: @affiliate, affiliate: { cellphone: @affiliate.cellphone, emailfau: @affiliate.emailfau, emailoffice: @affiliate.emailoffice, emailother: @affiliate.emailother, emailpersonal: @affiliate.emailpersonal, emergencyphone: @affiliate.emergencyphone, faxnumber: @affiliate.faxnumber, firstname: @affiliate.firstname, homecity: @affiliate.homecity, homephone: @affiliate.homephone, homestate: @affiliate.homestate, homestreet: @affiliate.homestreet, homezip: @affiliate.homezip, isfaculty: @affiliate.isfaculty, lastname: @affiliate.lastname, license: @affiliate.license, middlename: @affiliate.middlename, officecity: @affiliate.officecity, officestate: @affiliate.officestate, officestreet: @affiliate.officestreet, officezip: @affiliate.officezip, otherphonenumber: @affiliate.otherphonenumber, prefix: @affiliate.prefix, suffix: @affiliate.suffix, znumber: @affiliate.znumber }
    assert_redirected_to affiliate_path(assigns(:affiliate))
  end

  test "should destroy affiliate" do
    assert_difference('Affiliate.count', -1) do
      delete :destroy, id: @affiliate
    end

    assert_redirected_to affiliates_path
  end
end
