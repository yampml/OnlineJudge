class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.references :user, foreign_key: true
      t.binary :source_code, :limit => 10.megabyte
      t.datetime :time_at_submit
      t.json :result

      t.timestamps
    end
  end
end