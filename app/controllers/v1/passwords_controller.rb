class V1::PasswordsController < ApplicationController
  def update
    if Password::UpdatePassword.call(password_params)
      render json: { status: :ok }
    else
      render json: { status: 500 }
    end
  end

  private

  def password_params
    params.permit(:password, :user_id)
  end
end
