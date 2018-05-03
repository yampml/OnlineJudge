# == Schema Information
#
# Table name: problems
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  timelimit    :float
#  memlimit     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  file_name    :json
#  problem_type :string
#

class Problem < ApplicationRecord
	has_many :submissions
	belongs_to :contest, optional: true
	
	mount_uploaders :file_name, ProbUploader

end
