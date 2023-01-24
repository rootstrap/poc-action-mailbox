require 'rails_helper'

RSpec.describe TicketMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:ticket) { create(:ticket, user:) }

  it 'replies with an error message email' do
    expect { TicketMailer.new_ticket(user:, ticket_id: ticket.id).deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
