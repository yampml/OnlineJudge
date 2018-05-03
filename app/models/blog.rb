# == Schema Information
#
# Table name: blogs
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blog < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 140}
  validates :content, presence: true
  after_initialize :init
  
      def init
        self.vote_up  ||= 0           #will set the default value only if it's nil
        self.vote_down ||= 0
      end
end
