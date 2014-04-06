require 'test_helper'

class Admin::ReportControllerTest < ActionController::TestCase
  setup do
    @controller = ::Admin::ReportsController.new
  end

  test 'should get index' do
    sign_in :user, users(:admin)
    get 'index'
    assert_response :success
  end

  test 'should get edit' do
    sign_in :user, users(:admin)
    sochi = reports(:sochi)
    get 'edit', id: sochi
    assert_response :success
  end
end
