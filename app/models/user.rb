class User < ApplicationRecord
  # Return tests of certain level passed and passing by user.
  def test_by_level(level)
    user_id = self.id
    PassingTest.joins("JOIN tests ON passing_tests.test_id = tests.id").where("level = :level AND user_id = :user_id", level: level, user_id: user_id)    
  end
end
