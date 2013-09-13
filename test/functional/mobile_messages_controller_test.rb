require 'test_helper'

class MobileMessagesControllerTest < ActionController::TestCase
  setup do
    @mobile_message = mobile_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mobile_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mobile_message" do
    assert_difference('MobileMessage.count') do
      post :create, mobile_message: {  }
    end

    assert_redirected_to mobile_message_path(assigns(:mobile_message))
  end

  test "should show mobile_message" do
    get :show, id: @mobile_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mobile_message
    assert_response :success
  end

  test "should update mobile_message" do
    put :update, id: @mobile_message, mobile_message: {  }
    assert_redirected_to mobile_message_path(assigns(:mobile_message))
  end

  test "should destroy mobile_message" do
    assert_difference('MobileMessage.count', -1) do
      delete :destroy, id: @mobile_message
    end

    assert_redirected_to mobile_messages_path
  end
end
