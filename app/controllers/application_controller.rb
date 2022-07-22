class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['auth-token']
    decoded = jwt_decode(header)
    decoded['user_id'] == params[:user_id || :id]
  end
end
