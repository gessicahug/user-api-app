class V1::PasswordsController < ApplicationController
  include JsonWebToken
  before_action :authenticate_request

  def update
    PasswordUpdater.new(params).update_password
  end

  private

  def authenticate_request
    header = request.headers['auth-token']
    decoded = jwt_decode(header)
    decoded['user_id'] == params[:user_id]
  end

  def password_params
    params.permit(:password)
  end
end
