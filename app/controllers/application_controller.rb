class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :logged_in?

  #
  def current_user
  # @current_user ||= User.find_by(id:session[:user_id]) if session[:user_id]

    @current_user ||= if session[:user_type] == "admin"
                        Administrator.find_by(id: session[:user_id])
    else
                        User.find_by(id: session[:user_id])
                      end
  end

  def logged_in?
    current_user.present?
  end
  def require_admin
    unless logged_in? && session[:user_type] == "admin"
      redirect_to root_path, alert: "Access denied!"
    end
  end

  def require_login
    unless logged_in? 
      redirect_to login_path, alert: "You must log in first!"
    end
    end
  #
  # def admin?
  #   current_user.is_a?(Administrator)
  # end
  #
  # def require_admin
  #   unless admin?
  #     flash[:alert] = "You must be an admin to perform this action."
  #     redirect_to root_path
  #   end
  # end
end
