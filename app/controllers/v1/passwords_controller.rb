class V1::PasswordsController < ApplicationController
  include JsonWebToken

  def update
    Password::UpdatePassword.call(password_params)
  end

  private

  def password_params
    params.permit(:password)
  end
end
