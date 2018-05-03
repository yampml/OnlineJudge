class CreateContests < ActiveRecord::Migration[5.1]
  def change
    create_table :contests do |t|
    	t.string :name
    	t.datetime :start_time
    	t.integer :duration
    	t.integer :is_running

      t.timestamps
    end
  end
end
