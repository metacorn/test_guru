class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :category, foreign_key: true
    add_reference :questions, :test, foreign_key: true
    add_reference :answers, :question, foreign_key: true
    add_reference :passing_tests, :user, foreign_key: true
    add_reference :passing_tests, :test, foreign_key: true
  end
end
