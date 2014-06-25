require 'test_helper'

class FacultyClassificationsControllerTest < ActionController::TestCase
  setup do
    @faculty_classification = faculty_classifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faculty_classifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faculty_classification" do
    assert_difference('FacultyClassification.count') do
      post :create, faculty_classification: { classification: @faculty_classification.classification }
    end

    assert_redirected_to faculty_classification_path(assigns(:faculty_classification))
  end

  test "should show faculty_classification" do
    get :show, id: @faculty_classification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faculty_classification
    assert_response :success
  end

  test "should update faculty_classification" do
    put :update, id: @faculty_classification, faculty_classification: { classification: @faculty_classification.classification }
    assert_redirected_to faculty_classification_path(assigns(:faculty_classification))
  end

  test "should destroy faculty_classification" do
    assert_difference('FacultyClassification.count', -1) do
      delete :destroy, id: @faculty_classification
    end

    assert_redirected_to faculty_classifications_path
  end
end
