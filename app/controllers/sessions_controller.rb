class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email]) || Administrator.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_type] = user.is_a?(Administrator) ? "admin" : "user"

      Rails.logger.debug ">>> SESSION[:user_id]: #{session[:user_id]}"
      Rails.logger.debug ">>> SESSION[:user_type]: #{session[:user_type]}"
      Rails.logger.debug ">>> USER CLASS: #{user.class}"
      if user.is_a?(Administrator)
        redirect_to admin_root_path, notice: "Welcome, Admin!"
      else
        redirect_to root_path, notice: "Logged in successfully!"
      end
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil  # Clear session on logout
    session[:user_type] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end

# class SessionsController < ApplicationController
#   def new
#     if current_user
#       if admin?
#         redirect_to admin_movies_path, notice: "You're already logged in as Admin!"
#       else
#         redirect_to movies_path, notice: "You're already logged in!"
#       end
#     end
#   end
#
#   def create
#     # Find the user (either an Admin or a regular User) by email
#     user = Admin.find_by(email: params[:email]) || User.find_by(email: params[:email])
#
#     # Authenticate the user
#     if user && user.authenticate(params[:password])
#       session[:user_id] = user.id
#       if user.is_a?(Admin)
#         redirect_to admin_movies_path, notice: "Welcome, Admin!"
#       else
#         redirect_to movies_path, notice: "Welcome!"
#       end
#     else
#       flash.now[:alert] = "Invalid email or password!"
#       render :new
#     end
#   end
#
#   def destroy
#     session[:user_id] = nil
#     redirect_to login_path, notice: "Logged out successfully!"
#   end
# end

