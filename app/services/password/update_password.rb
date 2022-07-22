class Password::UpdatePassword < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    update_password
  end

  private

  def update_password
    @user = User.find(@params['user_id'])
    @user.update(
      password: @params['password']
    )
  end
end
