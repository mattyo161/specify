require 'test_helper'

class BpPropertiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_property" do
    assert_difference('BpProperty.count') do
      post :create, :bp_property => { }
    end

    assert_redirected_to bp_property_path(assigns(:bp_property))
  end

  test "should show bp_property" do
    get :show, :id => bp_properties(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bp_properties(:one).to_param
    assert_response :success
  end

  test "should update bp_property" do
    put :update, :id => bp_properties(:one).to_param, :bp_property => { }
    assert_redirected_to bp_property_path(assigns(:bp_property))
  end

  test "should destroy bp_property" do
    assert_difference('BpProperty.count', -1) do
      delete :destroy, :id => bp_properties(:one).to_param
    end

    assert_redirected_to bp_properties_path
  end
end
