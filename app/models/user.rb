class User < ApplicationRecord
  def test_by_level(level)
    Test.joins("JOIN passing_tests ON passing_tests.test_id = tests.id").where("level = :level AND user_id = :user_id", level: level, user_id: id)
  end
end
