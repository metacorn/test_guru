class AddTestCategoryIdNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :category_id, false)
  end
end
