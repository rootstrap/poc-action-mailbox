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
class Comment < ApplicationRecord
  belongs_to :ticket

  validates :body, presence: true
end
