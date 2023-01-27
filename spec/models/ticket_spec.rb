# == Schema Information
#
# Table name: tickets
#
#  id         :bigint           not null, primary key
#  subject    :string
#  body       :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tickets_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to belong_to(:user) }
end
