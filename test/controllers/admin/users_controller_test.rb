require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @controller = ::Admin::UsersController.new
  end

  test 'should get index' do
    sign_in :user, users(:admin)
    get 'index'
    assert_response :success
  end

  test 'should get edit' do
    sign_in :user, users(:admin)
    john = users(:john)
    get 'edit', id: john
    assert_response :success
  end

  test 'should update user' do
    user = users(:john)
    sign_in :user, users(:admin)

    patch :update, id: user, user: {
      email: 'some.random@email.com'
    }
    assert_redirected_to admin_user_path(assigns(:user))
  end

  test 'should update user with password' do
    user = users(:john)
    sign_in :user, users(:admin)

    patch :update, id: user, user: {
      password: '1234'
    }
    assert_redirected_to admin_user_path(assigns(:user))
  end

  test 'should not allow not admin users' do
    sign_in :user, users(:john)
    get 'index'
    assert_response 302
  end
end
