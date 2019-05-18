class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true

  def tests_by_level(level)
    tests.by_level(level)
  end
end
