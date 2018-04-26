class AddFileNameToProblem < ActiveRecord::Migration[5.1]
  def change
  	add_column :problems, :file_name, :json
  end
end
