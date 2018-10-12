class Test < ApplicationRecord
  alias_attribute :test_title, :title
  alias_attribute :author_id, :user_id

  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :passing_tests
  has_many :users, through: :passing_tests

  def self.ordered_tests_titles_by_category(category_title)
    joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
  end
end
