require 'test_helper'

class ManualsControllerTest < ActionController::TestCase
  setup do
    @manual = manuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manual" do
    assert_difference('Manual.count') do
      post :create, manual: { file: @manual.file, name: @manual.name, name_ukr: @manual.name_ukr, subject: @manual.subject }
    end

    assert_redirected_to manual_path(assigns(:manual))
  end

  test "should show manual" do
    get :show, id: @manual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manual
    assert_response :success
  end

  test "should update manual" do
    patch :update, id: @manual, manual: { file: @manual.file, name: @manual.name, name_ukr: @manual.name_ukr, subject: @manual.subject }
    assert_redirected_to manual_path(assigns(:manual))
  end

  test "should destroy manual" do
    assert_difference('Manual.count', -1) do
      delete :destroy, id: @manual
    end

    assert_redirected_to manuals_path
  end
end
