class UserUpdater
  def initialize(params, user)
    @params = params
    @user = user
  end

  def update_user
    @user = User.update(
      name: @params['name'],
      email: @params['email'],
    )
  end
end
