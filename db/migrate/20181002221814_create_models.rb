class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.timestamps
    end
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.timestamps
    end
    create_table :questions do |t|
      t.text :body
      t.timestamps
    end
    create_table :answers do |t|
      t.text :body
      t.boolean :correct
      t.timestamps
    end
    create_table :users do |t|
      t.integer :type
      t.timestamps
    end
  end
end
