class DropTablePassingTests < ActiveRecord::Migration[5.2]
  def up
    drop_table :passing_tests, if_exists: true
  end
  def down
    create_table :passing_tests do |t|
      t.boolean :passed
      t.integer :user_id
      t.integer :test_id
    end
  end
end