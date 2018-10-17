class Test < ApplicationRecord
  alias_attribute :test_title, :title
  #alias_attribute :author_id, :user_id

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :questions
  has_many :passing_tests
  has_many :users, through: :passing_tests

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }
  scope :by_level, -> (level) { where(level: level) }

  def self.ordered_tests_titles_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
