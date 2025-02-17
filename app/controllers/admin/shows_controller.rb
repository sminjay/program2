module Admin
  class Admin::ShowsController < ApplicationController
    before_action :require_admin

   layout "admin"
    def index
      @shows = Show.all
      render "/admin/shows/index"
    end

    def show
      @show = Show.find(params[:id])
      # render "/admin/shows/show"
      render :show
    end

    def new
      @show = Show.new
      #render "/admin/shows/new"
    end

    def create
      @show = Show.new(show_params)
      if @show.save
        redirect_to admin_shows_path, notice: "Show created successfully!"
      else
        render :new
      end
    end

    def edit
      @show = Show.find(params[:id])
    end

    def update
      @show = Show.find(params[:id])
      if @show.update(show_params)
        redirect_to admin_shows_path, notice: "Show updated successfully!"
      else
        render :edit
      end
    end

    def destroy
      @show = Show.find(params[:id])
      @show.destroy
      redirect_to admin_shows_path, notice: "Show deleted successfully!"
    end

    private

    def show_params
      params.require(:show).permit(:movie_id, :date, :time, :seats_available, :ticket_price)
    end
  end

end