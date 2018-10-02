#set default value of correct answer to 'I know it!'
class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :correct, 'I know it!')
  end
end
