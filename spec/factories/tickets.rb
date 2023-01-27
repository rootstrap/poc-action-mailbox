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
FactoryBot.define do
  factory :ticket do
    subject { Faker::Internet.name }
    body { Faker::Lorem.paragraph(sentence_count: 1) }
    user { create(:user) }
  end
end
