class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['auth-token']
    decoded = jwt_decode(header) if header
    decoded['user_id'] == params[:user_id || :id]
  end
end
