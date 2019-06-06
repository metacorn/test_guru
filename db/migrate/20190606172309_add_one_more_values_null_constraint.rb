class AddOneMoreValuesNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:user_badges, :test_passage_id, false)
  end
end
