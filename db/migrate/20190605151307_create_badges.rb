class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.integer :rule_type, null: false
      t.string :rule_value

      t.timestamps
    end
  end
end
