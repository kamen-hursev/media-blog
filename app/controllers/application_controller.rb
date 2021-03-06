class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    access_denied(exception)
  end

  def access_denied(exception)
    redirect_to root_url, alert: exception.message
  end
end
