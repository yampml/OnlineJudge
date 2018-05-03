class AddIsShowOnProblemListToProblems < ActiveRecord::Migration[5.1]
  def change
  	add_column :problems, :is_show, :integer
  end
end
