class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  def errors_listing(object)
    message = object.errors.full_messages.map { |m| "#{m}." }
    message.join(" ")
  end

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path
      cookies[:path] = request.path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session[:user_id].destroy
  end
end
