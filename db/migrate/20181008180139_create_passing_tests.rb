class CreatePassingTests < ActiveRecord::Migration[5.2]
  def change
    create_table :passing_tests do |t|
      t.boolean :passed

      t.timestamps
    end
  end
end
