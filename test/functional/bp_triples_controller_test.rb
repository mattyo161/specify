require 'test_helper'

class BpTriplesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_triples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_triple" do
    assert_difference('BpTriple.count') do
      post :create, :bp_triple => { }
    end

    assert_redirected_to bp_triple_path(assigns(:bp_triple))
  end

  test "should show bp_triple" do
    get :show, :id => bp_triples(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bp_triples(:one).to_param
    assert_response :success
  end

  test "should update bp_triple" do
    put :update, :id => bp_triples(:one).to_param, :bp_triple => { }
    assert_redirected_to bp_triple_path(assigns(:bp_triple))
  end

  test "should destroy bp_triple" do
    assert_difference('BpTriple.count', -1) do
      delete :destroy, :id => bp_triples(:one).to_param
    end

    assert_redirected_to bp_triples_path
  end
end
