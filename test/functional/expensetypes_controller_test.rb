require 'test_helper'

class ExpensetypesControllerTest < ActionController::TestCase
  setup do
    @expensetype = expensetypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expensetypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expensetype" do
    assert_difference('Expensetype.count') do
      post :create, expensetype: { description: @expensetype.description, name: @expensetype.name }
    end

    assert_redirected_to expensetype_path(assigns(:expensetype))
  end

  test "should show expensetype" do
    get :show, id: @expensetype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expensetype
    assert_response :success
  end

  test "should update expensetype" do
    put :update, id: @expensetype, expensetype: { description: @expensetype.description, name: @expensetype.name }
    assert_redirected_to expensetype_path(assigns(:expensetype))
  end

  test "should destroy expensetype" do
    assert_difference('Expensetype.count', -1) do
      delete :destroy, id: @expensetype
    end

    assert_redirected_to expensetypes_path
  end
end
