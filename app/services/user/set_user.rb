class User::SetUser < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    set_users
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
