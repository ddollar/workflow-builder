class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method :current_user
  helper_method :ensure_authenticated!

  before_filter :store_return_to

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def ensure_authenticated!
    redirect_to "/sessions/new" unless current_user
  end

  def store_return_to
    session[:return_to] = request.fullpath
  end

end
