class Contest < ApplicationRecord
	has_many :problems
	has_many :submissions
	has_and_belongs_to_many :users 
end
