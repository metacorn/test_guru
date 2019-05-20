class RemoveFieldFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :password
  end

  def down
    add_column :users, :password, :string
  end
end
