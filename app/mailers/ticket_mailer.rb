class TicketMailer < ApplicationMailer
  def new_ticket(user:, ticket_id:)
    @from = "support-#{ticket_id}@rootstrap.com"
    @ticket_id = ticket_id
    subject = I18n.t('email.ticket.new_ticket', ticket_id:)
    mail from: @from, to: user.email, subject:
  end

  def missing(inbound_email)
    mail to: inbound_email,
         subject: I18n.t('email.ticket.ticket_does_not_exist')
  end
end
