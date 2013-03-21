# -*- encoding : utf-8 -*-
require 'test_helper'

class EdizmsControllerTest < ActionController::TestCase
  setup do
    @edizm = edizms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:edizms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create edizm" do
    assert_difference('Edizm.count') do
      post :create, edizm: { name: @edizm.name }
    end

    assert_redirected_to edizm_path(assigns(:edizm))
  end

  test "should show edizm" do
    get :show, id: @edizm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @edizm
    assert_response :success
  end

  test "should update edizm" do
    put :update, id: @edizm, edizm: { name: @edizm.name }
    assert_redirected_to edizm_path(assigns(:edizm))
  end

  test "should destroy edizm" do
    assert_difference('Edizm.count', -1) do
      delete :destroy, id: @edizm
    end

    assert_redirected_to edizms_path
  end
end
