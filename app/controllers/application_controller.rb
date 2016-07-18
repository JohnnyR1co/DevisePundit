class ApplicationController < ActionController::Base
  include Pundit
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorize

  private

  def user_not_authorized(exception)
   policy_name = exception.policy.class.to_s.underscore

   flash[:notice] = 'access denied'
   redirect_to(request.referrer || root_path)
  end
end
