class AddTypeToProblem < ActiveRecord::Migration[5.1]
  def change
    add_column :problems, :problem_type, :string
  end
end
