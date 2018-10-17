class AddMoreValuesNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:passing_tests, :user_id, false)
    change_column_null(:passing_tests, :test_id, false)
    change_column_null(:tests, :user_id, false)
  end
end
