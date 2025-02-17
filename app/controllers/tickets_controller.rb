class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :require_login
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /tickets or /tickets.json
  def index
    # @tickets = Ticket.all
    @tickets = current_user.tickets
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @ticket.show_id = params[:show_id].to_i if params[:show_id].present?  # Convert to integer
    @shows = Show.all

    if @ticket.show_id.present?
      @show = Show.find(@ticket.show_id)
      @ticket_price = @show.ticket_price
    end
    end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  # def create
  #   @ticket = current_user.tickets.build(ticket_params) # Assigns user_id automatically
  #
  #
  #   respond_to do |format|
  #     if @ticket.save
  #       format.html { redirect_to @ticket, notice: "Ticket was successfully created." }
  #       format.json { render :show, status: :created, location: @ticket }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @ticket.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id  # Ensure the user ID is automatically assigned

    show = Show.find(@ticket.show_id)

    if show.seats_available >= 1  # Assuming you're booking 1 ticket per transaction
      show.seats_available -= 1  # Reduce the available seats by 1 when a ticket is booked

      ActiveRecord::Base.transaction do
        show.save!  # Save the updated show with the new available seat count
        @ticket.save!  # Save the new ticket
      end

      # Redirect after successfully booking the ticket
      redirect_to tickets_path, notice: "Ticket booked successfully! Total: $#{show.ticket_price}"
    else
      flash[:alert] = "Not enough seats available!"
      render :new
    end
  end


  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    # @ticket.destroy!
    #
    # respond_to do |format|
    #   format.html { redirect_to tickets_path, status: :see_other, notice: "Ticket was successfully destroyed." }
    #   format.json { head :no_content }
    # end
    @ticket = Ticket.find(params[:id])
    show = @ticket.show  # Get the associated show for the ticket

    # Increase the available seats by 1
    show.seats_available += 1

    ActiveRecord::Base.transaction do
      show.save!  # Save the updated show with the increased seats
      @ticket.destroy!  # Destroy the ticket
    end

    redirect_to tickets_path, notice: "Ticket was successfully destroyed. Available seats for the show have been updated."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params.expect(:id))
    end
  def correct_user
    @ticket = Ticket.find(params[:id])
    unless @ticket.user == current_user
      flash[:warning] = "Not authorized to edit this ticket!"
      redirect_to tickets_path, alert: "Not authorized to edit this ticket!"
    end
  end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:show_id, :confirmation_number, :status)
      end
end
