require 'digest/sha1'

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def authentificate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
