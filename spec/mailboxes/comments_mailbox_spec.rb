require 'rails_helper'

RSpec.describe CommentsMailbox, type: :mailbox do
  subject { process(mail) }

  let(:ticket) { create(:ticket) }
  let(:support_email) { "ticket-#{ticket.id}@#{ApplicationMailer::SUPPORT_DOMAIN}" }
  let(:email_subject) { ticket.subject }
  let(:body) { Faker::Lorem.paragraphs(number: 2).join(',') }
  let(:mail) do
    Mail.new(from: user.email,
             to: support_email,
             subject: email_subject,
             body:)
  end
  let(:user) { ticket.user }

  context 'with valid params' do
    it 'marks email as delivered when the from receipt is monterrey-(#ticket)' do
      expect(subject).to have_been_delivered
    end

    it 'creates a new Ticket comment' do
      expect { subject }.to change(ticket.comments, :count).by(1)
    end
  end

  context 'with invalid params' do
    context 'when the user client does not exist' do
      let(:user) { build(:user) }

      it 'marks email as bounced when a receipt does not exist' do
        expect(subject).to have_bounced
      end
    end

    context 'when the ticket id in the support email does not exist' do
      let(:support_email) { "ticket-#{ticket.id + 10}@#{ApplicationMailer::SUPPORT_DOMAIN}" }

      it 'marks email as bounced when a receipt does not exist' do
        expect(subject).to have_bounced
      end
    end
  end
end
