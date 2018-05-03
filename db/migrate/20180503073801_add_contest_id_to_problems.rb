class AddContestIdToProblems < ActiveRecord::Migration[5.1]
  def change
  	add_column :problems, :contest_id, :integer
  end
end
