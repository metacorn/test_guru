class RemoveFieldsFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :password
    remove_column :users, :username
    remove_column :users, :user_class
  end

  def down
    add_column :users, :password, :string
    add_column :users, :username, :string
    add_column :users, :user_class, :integer
  end
end