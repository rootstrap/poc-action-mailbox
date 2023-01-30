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
class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :subject, :body, presence: true
end
