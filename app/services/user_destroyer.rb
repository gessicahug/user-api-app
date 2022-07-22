class UserDestroyer
  def initialize(user)
    @user = user
  end

  def destroy_user
    @user.destroy
  end
end
