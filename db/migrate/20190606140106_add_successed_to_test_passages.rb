class AddSuccessedToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :successed, :boolean, default: false
  end
end
