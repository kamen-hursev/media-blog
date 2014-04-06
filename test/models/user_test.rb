require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should find user for facebook oauth' do
    auth = OmniAuth.config.mock_auth[:facebook]

    user = User.find_for_facebook_oauth(auth)
    assert user
  end
end
