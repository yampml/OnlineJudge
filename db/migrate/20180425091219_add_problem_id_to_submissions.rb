class AddProblemIdToSubmissions < ActiveRecord::Migration[5.1]
  def change
  	add_reference :submissions, :problem, foreign_key: true
  end
end
