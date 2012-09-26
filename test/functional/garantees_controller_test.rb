require 'test_helper'

class GaranteesControllerTest < ActionController::TestCase
  setup do
    @garantee = garantees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garantees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garantee" do
    assert_difference('Garantee.count') do
      post :create, garantee: { name: @garantee.name }
    end

    assert_redirected_to garantee_path(assigns(:garantee))
  end

  test "should show garantee" do
    get :show, id: @garantee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @garantee
    assert_response :success
  end

  test "should update garantee" do
    put :update, id: @garantee, garantee: { name: @garantee.name }
    assert_redirected_to garantee_path(assigns(:garantee))
  end

  test "should destroy garantee" do
    assert_difference('Garantee.count', -1) do
      delete :destroy, id: @garantee
    end

    assert_redirected_to garantees_path
  end
end
