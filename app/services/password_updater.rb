class PasswordUpdater
  def initialize(params)
    @params = params
  end

  def update_password
    @user = User.find(@params[:user_id])
    @user.update(
      password: @params['password']
    )
  end
end
