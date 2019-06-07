class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.integer :image, null: false
      t.integer :color, null: false
      t.integer :rule_type, null: false
      t.string :rule_value

      t.timestamps
    end
  end
end
