require 'test_helper'

class Admin::CategoriesControllerTest < ActionController::TestCase
  setup do
    @controller = ::Admin::CategoriesController.new
  end

  test 'should get index' do
    sign_in :user, users(:admin)
    get 'index'
    assert_response :success
  end
end
