class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Make sure the user is connected.
  before_filter :authenticate!

  private

  def authenticate!
    redirect_to signin_path unless session[:user_id].present?
  end
end
