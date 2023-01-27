require 'rails_helper'

RSpec.describe TicketMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:ticket) { create(:ticket, user:) }

  it 'replies when a new ticket was created' do
    expect { TicketMailer.new_ticket(user:, ticket_id: ticket.id).deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it 'replies with an error message email when the ticket does not exist' do
    expect { TicketMailer.missing_ticket(user.email).deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
