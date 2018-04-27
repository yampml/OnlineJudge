class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  mount_uploader :solution_name, SolutionUploader
end
