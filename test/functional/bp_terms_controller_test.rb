require 'test_helper'

class BpTermsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_terms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_term" do
    assert_difference('BpTerm.count') do
      post :create, :bp_term => { }
    end

    assert_redirected_to bp_term_path(assigns(:bp_term))
  end

  test "should show bp_term" do
    get :show, :id => bp_terms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bp_terms(:one).to_param
    assert_response :success
  end

  test "should update bp_term" do
    put :update, :id => bp_terms(:one).to_param, :bp_term => { }
    assert_redirected_to bp_term_path(assigns(:bp_term))
  end

  test "should destroy bp_term" do
    assert_difference('BpTerm.count', -1) do
      delete :destroy, :id => bp_terms(:one).to_param
    end

    assert_redirected_to bp_terms_path
  end
end
