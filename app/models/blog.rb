# == Schema Information
#
# Table name: blogs
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  vote_up    :integer
#  vote_down  :integer
#

class Blog < ApplicationRecord
  belongs_to :user
  acts_as_votable
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 40}
  validates :content, presence: true
end
