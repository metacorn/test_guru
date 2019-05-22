class RemoveFieldsFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :password
  end

  def down
    add_column :users, :password, :string
  end

  def up
    remove_column :users, :user_class
  end

  def down
    add_column :users, :user_class, :integer
  end

  def up
    remove_column :users, :username
  end

  def down
    add_column :users, :username, :string
  end
end
