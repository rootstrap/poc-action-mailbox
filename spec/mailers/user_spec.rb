require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:inbound_email) { Faker::Internet.email }

  it 'replies with an error message email' do
    expect { UserMailer.missing(inbound_email).deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
