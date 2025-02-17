module Admin
  class Admin::TicketsController < ApplicationController

    def index
      @tickets = Ticket.all
      render "/admin/tickets/index"
    end

    def show
      @ticket = Ticket.find(params[:id])
      #render "/admin/tickets/show"
    end
    def create
      @ticket = Ticket.new(ticket_params)

      if @ticket.save
        redirect_to admin_tickets_path, notice: "Ticket created successfully."
      else
        render :new
      end
    end
    def new
      @ticket = Ticket.new
      #render "/admin/tickets/new"
    end
    def edit
      @ticket = Ticket.find(params[:id])
    end
    def destroy
      @ticket = Ticket.find(params[:id])
      @ticket.destroy
      redirect_to admin_tickets_path, notice: "Ticket deleted successfully!"
    end
  end
  end