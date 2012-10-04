require 'test_helper'

class ChmailsControllerTest < ActionController::TestCase
  setup do
    @chmail = chmails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chmails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chmail" do
    assert_difference('Chmail.count') do
      post :create, chmail: { email: @chmail.email }
    end

    assert_redirected_to chmail_path(assigns(:chmail))
  end

  test "should show chmail" do
    get :show, id: @chmail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chmail
    assert_response :success
  end

  test "should update chmail" do
    put :update, id: @chmail, chmail: { email: @chmail.email }
    assert_redirected_to chmail_path(assigns(:chmail))
  end

  test "should destroy chmail" do
    assert_difference('Chmail.count', -1) do
      delete :destroy, id: @chmail
    end

    assert_redirected_to chmails_path
  end
end
