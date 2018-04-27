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

class Problem < ApplicationRecord
	has_many :submissions

	mount_uploaders :file_name, ProbUploader

end
