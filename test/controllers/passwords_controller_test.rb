require 'test_helper'

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  include JsonWebToken
  setup do
    @user = users(:one)
    @user.token = jwt_encode(user_id: @user.id)
  end

  test 'should update user' do
    put v1_user_password_path(@user.id, id:1), params: { new_password: '321321' }, headers: { 'auth-token': @user.token }
    assert_response(:success)
  end
end
