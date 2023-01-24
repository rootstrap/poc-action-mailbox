require 'rails_helper'

RSpec.describe TicketMailbox, type: :mailbox do
  let(:body) { Faker::Lorem.paragraphs(number: 2).join(',') }
  let(:subject) { Faker::Internet.name }

  context 'with valid params' do
    let(:user) { create(:user) }

    it 'marks email as delivered when the from receipt is monterrey' do
      mail = Mail.new(from: user.email,
                      to: 'support@rootstrap.com',
                      subject:,
                      body:)

      mail_processed = process(mail)

      expect(mail_processed).to have_been_delivered
    end

    it 'creates a new Ticket' do
      mail = Mail.new(from: user.email,
                      to: 'support@rootstrap.com',
                      subject:,
                      body:)

      expect { process(mail) }.to change(Ticket, :count).from(0).to(1)
    end
  end

  context 'with invalid params' do
    it 'marks email as bounced when a receipt does not exist' do
      mail = Mail.new(
        from: 'example@gmail.com',
        to: 'support@rootstrap.com',
        subject:,
        body:
      )
      mail_processed = process(mail)

      expect(mail_processed).to have_bounced
    end
  end
end
