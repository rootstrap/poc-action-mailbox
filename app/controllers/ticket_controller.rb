class TicketController < ApplicationController
  def confirm
    redirect_to not_success_ticket_token_path if ticket.nil?
  end

  def not_success; end

  private

  def ticket
    @ticket ||= Ticket.find_signed(params[:token], purpose: :ticket_confirmation)
  end
end
