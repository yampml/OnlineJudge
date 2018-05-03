# == Schema Information
#
# Table name: submissions
#
#  id             :bigint(8)        not null, primary key
#  user_id        :bigint(8)
#  source_code    :binary
#  time_at_submit :datetime
#  result         :json
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  problem_id     :bigint(8)
#  solution_name  :string
#

class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  belongs_to :contest, optional: true
  mount_uploader :solution_name, SolutionUploader
end
