class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  # def authenticate_user
  #   if request.headers['Authorization'].present?
  #     authenticate_or_request_with_http_token do |token|
  #       begin
  #         jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
  #         @current_user_id = jwt_payload['id']
  #       rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
  #         head :unauthorized
  #       end
  #     end
  #   end
  # end
  #
  # def authenticate_user!(options = {})
  #   head :unauthorized unless signed_in?
  # end
  #
  # def current_user
  #   User.find(params[:user_id])
  # end
  #
  # def signed_in?
  #   @current_user_id.present?
  # end
end
