class User::GetAllUsers < ApplicationService
  def initialize
  end

  def call
    set_users
  end

  private

  def set_users
    @users = User.all
  end
end
