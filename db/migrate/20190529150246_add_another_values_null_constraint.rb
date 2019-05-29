class AddAnotherValuesNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:gists, :user_id, false)
    change_column_null(:gists, :question_id, false)
    change_column_null(:gists, :gist_url, false)
    change_column_null(:test_passages, :user_id, false)
    change_column_null(:test_passages, :test_id, false)
    change_column_null(:test_passages, :current_question_id, false)
  end
end
