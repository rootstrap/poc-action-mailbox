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
FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph_by_chars }
    ticket { build(:ticket) }
  end
end
