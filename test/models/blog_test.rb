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

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
