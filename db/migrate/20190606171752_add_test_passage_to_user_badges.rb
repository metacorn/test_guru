class AddTestPassageToUserBadges < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_badges, :test_passage, foreign_key: true
  end
end
