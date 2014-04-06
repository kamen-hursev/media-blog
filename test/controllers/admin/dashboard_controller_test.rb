require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase
  setup do
    @controller = ::Admin::DashboardController.new
  end

  test 'should get index' do
    sign_in :user, users(:admin)
    get 'index'
    assert_response :success
  end

  test 'should not allow not admin users' do
    sign_in :user, users(:john)
    get 'index'
    assert_response 302
  end
end
