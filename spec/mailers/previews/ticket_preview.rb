# Preview all emails at http://localhost:3000/rails/mailers/ticket
class TicketPreview < ActionMailer::Preview
  def new_ticket
    user = User.last
    ticket = Ticket.last
    TicketMailer.new_ticket(user:, ticket_id: ticket.id)
  end

  def missing_ticket
    user = User.last
    TicketMailer.missing_ticket(user.email)
  end
end
