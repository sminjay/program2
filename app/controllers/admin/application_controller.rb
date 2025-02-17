module Admin
  class Admin::ApplicationController < ActionController::Base
    before_action :require_admin
    layout "admin"

    helper_method :current_user, :logged_in?

    def current_user
      Rails.logger.info "Session user_id: #{session[:user_id]}" # Debugging
      Rails.logger.info "Session user_type: #{session[:user_type]}" # Debugging

      if session[:user_id]
        if session[:user_type] == "admin"
          @current_user = Administrator.find_by(id: session[:user_id])
        else
          @current_user = User.find_by(id: session[:user_id])
        end
        Rails.logger.info "Current user: #{@current_user.inspect}"
      end

      @current_user
    end

    def logged_in?
      Rails.logger.info "Logged in status: #{current_user.present?}" # Debugging
      current_user.present?
    end

    private
    def require_admin
      unless session[:user_type] == "admin"
        flash[:warning] = "You need admin privileges to access this page."
        redirect_to root_path, alert: "Access denied."
      end
    end

  end
end
