require 'test_helper'

class ImagingObservationCharacteristicsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imaging_observation_characteristics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imaging_observation_characteristic" do
    assert_difference('ImagingObservationCharacteristic.count') do
      post :create, :imaging_observation_characteristic => { }
    end

    assert_redirected_to imaging_observation_characteristic_path(assigns(:imaging_observation_characteristic))
  end

  test "should show imaging_observation_characteristic" do
    get :show, :id => imaging_observation_characteristics(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => imaging_observation_characteristics(:one).to_param
    assert_response :success
  end

  test "should update imaging_observation_characteristic" do
    put :update, :id => imaging_observation_characteristics(:one).to_param, :imaging_observation_characteristic => { }
    assert_redirected_to imaging_observation_characteristic_path(assigns(:imaging_observation_characteristic))
  end

  test "should destroy imaging_observation_characteristic" do
    assert_difference('ImagingObservationCharacteristic.count', -1) do
      delete :destroy, :id => imaging_observation_characteristics(:one).to_param
    end

    assert_redirected_to imaging_observation_characteristics_path
  end
end
