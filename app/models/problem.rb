class Problem < ApplicationRecord
	has_many :submissions, dependent: :destroy

	mount_uploaders :file_name, ProbUploader

end
