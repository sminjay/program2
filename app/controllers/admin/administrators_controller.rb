module Admin
  class AdministratorsController < ApplicationController
    before_action :set_administrator, only: [:show, :edit, :update, :destroy]

    def show
      # Render the admin profile page
    end

    def edit
      # Render the edit form
    end

    def update
      if @administrator.update(administrator_params)
        redirect_to admin_administrator_path(@administrator), notice: "Admin updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @administrator.destroy
      redirect_to admin_administrators_path, notice: "Admin deleted successfully."
    end

    private

    def set_administrator
      @administrator = Administrator.find_by(id: params[:id])
      if @administrator.nil?
        flash[:alert] = "Admin not found."
        redirect_to admin_administrators_path
      end
    end

    def administrator_params
      params.require(:administrator).permit(:name,:email)
    end
  end
end