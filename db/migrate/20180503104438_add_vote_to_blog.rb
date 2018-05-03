class AddVoteToBlog < ActiveRecord::Migration[5.1]
  def change
  add_column :blogs, :vote_up, :integer
  add_column :blogs, :vote_down, :integer
  end
end
