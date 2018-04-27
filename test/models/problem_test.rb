# == Schema Information
#
# Table name: problems
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  timelimit  :float
#  memlimit   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  file_name  :json
#

require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
