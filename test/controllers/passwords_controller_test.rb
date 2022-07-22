require 'test_helper'

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should update user' do
    patch v1_user_password_url(@user), params: { new_password: '321321' }
    assert_response(:success)
  end
end
