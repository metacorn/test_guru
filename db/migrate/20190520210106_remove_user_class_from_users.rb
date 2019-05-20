class RemoveUserClassFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :user_class
  end

  def down
    add_column :users, :user_class, :integer
  end
end
