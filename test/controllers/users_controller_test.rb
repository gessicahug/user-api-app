require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include JsonWebToken
  setup do
    @user = users(:one)
    @user.token = jwt_encode(user_id: @user.id)
  end

  test 'should create user' do
    assert_difference('User.count') do
      post v1_users_url, params: {
        email: 'gessica@gmail.com',
        password: '123123',
        password_confirmation: '123123'
      }
    end

    assert_response(:success)
  end

  test 'should update user' do
    put v1_user_path(@user), params: { email: 'gessica2@gmail.com' }, headers: { 'auth-token': @user.token }
    assert_response(:success)
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete v1_user_path(@user), headers: { 'auth-token': @user.token }
    end
  end
end
