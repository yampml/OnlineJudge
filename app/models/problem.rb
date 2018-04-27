class Problem < ApplicationRecord
	has_many :submissions

	mount_uploaders :file_name, ProbUploader

end
