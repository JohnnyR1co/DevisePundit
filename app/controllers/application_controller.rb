class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  add_flash_types :success, :info, :warning, :danger
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
   policy_name = exception.policy.class.to_s.underscore

   flash[:danger] = 'access denied'
   redirect_to(request.referrer || root_path)
  end
end
