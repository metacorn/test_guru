class User < ApplicationRecord
  def test_by_level(level)    
    PassingTest.joins("JOIN tests ON passing_tests.test_id = tests.id").where("level = :level AND user_id = :user_id", level: level, user_id: id).to_a
  end
end
