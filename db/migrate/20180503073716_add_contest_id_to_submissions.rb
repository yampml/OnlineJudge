class AddContestIdToSubmissions < ActiveRecord::Migration[5.1]
  def change
  	add_column :submissions, :contest_id, :integer
  end
end
