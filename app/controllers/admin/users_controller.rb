module Admin
  class Admin::UsersController < ApplicationController
   layout 'admin'

    def index
      @users = User.all
      render "/admin/users/index"
    end
    def new
      @user = User.new
      render "admin/users/new"
    end
    def show
      @user = User.find(params[:id])
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "User deleted successfully!"
    end

   private

  end

  end