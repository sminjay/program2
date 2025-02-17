class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show edit update destroy ]
  before_action :require_login
  # before_action :require_admin
  # GET /shows or /shows.json
  def index
    if params[:movie_id] # Check if movie_id is passed in URL
      @movie = Movie.find(params[:movie_id])
      @shows = @movie.shows
    else
      @shows = Show.all
    end
  end


  # GET /shows/1 or /shows/1.json
  def show
    @show = Show.find(params[:id])
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows or /shows.json
  def create
    @show = Show.new(show_params)

    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: "Show was successfully created." }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :'admin/shows/new', status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1 or /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: "Show was successfully updated." }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1 or /shows/1.json
  def destroy
    @show.destroy!

    respond_to do |format|
      format.html { redirect_to shows_path, status: :see_other, notice: "Show was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params.require(:id))
    end

  def price
    @show = Show.find(params[:id])
    render json: { price: @show.ticket_price }
  end
    # Only allow a list of trusted parameters through.
    def show_params
      params.require(show: [ :movie_id, :date, :time, :seats_available, :ticket_price ])
    end
  end
