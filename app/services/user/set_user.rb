class User::SetUser < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    set_user(@params)
  end

  private

  def set_user(params)
    @user = User.find(params[:id])
  end
end
