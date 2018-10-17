class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test'
  has_many :passing_tests
  has_many :tests, through: :passing_tests

  def tests_by_level(level)
    tests.by_level(level)
  end
end
