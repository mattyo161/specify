require 'test_helper'

class BpOntologiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_ontologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_ontology" do
    assert_difference('BpOntology.count') do
      post :create, :bp_ontology => { }
    end

    assert_redirected_to bp_ontology_path(assigns(:bp_ontology))
  end

  test "should show bp_ontology" do
    get :show, :id => bp_ontologies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bp_ontologies(:one).to_param
    assert_response :success
  end

  test "should update bp_ontology" do
    put :update, :id => bp_ontologies(:one).to_param, :bp_ontology => { }
    assert_redirected_to bp_ontology_path(assigns(:bp_ontology))
  end

  test "should destroy bp_ontology" do
    assert_difference('BpOntology.count', -1) do
      delete :destroy, :id => bp_ontologies(:one).to_param
    end

    assert_redirected_to bp_ontologies_path
  end
end
