require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: 'gessica@gmail.com', password: '123123', password_confirmation: '123123')
  end

  test 'user model should not create a user without email' do
    user = User.create(password: '123123', password_confirmation: '123123')
    assert_not user.save, 'Created user without email'
  end

  test 'user email has to be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'user email has to be valid' do
    assert @user.email.match?(URI::MailTo::EMAIL_REGEXP)
  end

  test 'user model should not create a user without password' do
    user = User.create(email: 'gessica@gmail.com')
    assert_not user.save, 'Created user without password'
  end

  test 'user model has secure password' do
    assert_respond_to @user, :password_digest
    assert_respond_to @user, :authenticate, 'User requires has_secure_password'
  end
end
