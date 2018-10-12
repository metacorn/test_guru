class User < ApplicationRecord
  has_many :tests
  has_many :passing_tests
  has_many :tests, through: :passing_tests

  def test_by_level(level)
    Test.joins("JOIN passing_tests ON passing_tests.test_id = tests.id").where("tests.level = :level AND passing_tests.user_id = :user_id", level: level, user_id: user_id)
  end
end
