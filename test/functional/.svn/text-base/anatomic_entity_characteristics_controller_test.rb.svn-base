require 'test_helper'

class AnatomicEntityCharacteristicsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anatomic_entity_characteristics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anatomic_entity_characteristic" do
    assert_difference('AnatomicEntityCharacteristic.count') do
      post :create, :anatomic_entity_characteristic => { }
    end

    assert_redirected_to anatomic_entity_characteristic_path(assigns(:anatomic_entity_characteristic))
  end

  test "should show anatomic_entity_characteristic" do
    get :show, :id => anatomic_entity_characteristics(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => anatomic_entity_characteristics(:one).to_param
    assert_response :success
  end

  test "should update anatomic_entity_characteristic" do
    put :update, :id => anatomic_entity_characteristics(:one).to_param, :anatomic_entity_characteristic => { }
    assert_redirected_to anatomic_entity_characteristic_path(assigns(:anatomic_entity_characteristic))
  end

  test "should destroy anatomic_entity_characteristic" do
    assert_difference('AnatomicEntityCharacteristic.count', -1) do
      delete :destroy, :id => anatomic_entity_characteristics(:one).to_param
    end

    assert_redirected_to anatomic_entity_characteristics_path
  end
end
