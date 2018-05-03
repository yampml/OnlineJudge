class CreateJoinTableContestsUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :contests, :users do |t|
      # t.index [:contest_id, :user_id]
      # t.index [:user_id, :contest_id]
    end
  end
end
