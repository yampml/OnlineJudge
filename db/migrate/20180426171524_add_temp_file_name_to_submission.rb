class AddTempFileNameToSubmission < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :solution_name, :string
  end
end
