# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  ticket_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_ticket_id  (ticket_id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:ticket) }
  it { is_expected.to validate_presence_of(:body) }
end
