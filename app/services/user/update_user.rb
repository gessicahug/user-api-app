class User::UpdateUser < ApplicationService
  def initialize(params, user)
    @params = params
    @user = user
  end

  def call
    update_user
  end

  private

  def update_user
    @user.update_attribute(:name, @params['name'])
  end
end
