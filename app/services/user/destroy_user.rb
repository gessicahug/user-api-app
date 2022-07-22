class User::DestroyUser < ApplicationService
  def initialize(user)
    @user = user
  end

  def call
    destroy_user
  end

  private

  def destroy_user
    @user.destroy
  end
end
