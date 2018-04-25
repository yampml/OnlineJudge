class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.string :name
      t.float :timelimit
      t.integer :memlimit

      t.timestamps
    end
  end
end
