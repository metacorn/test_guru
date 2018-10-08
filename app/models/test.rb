class Test < ApplicationRecord
  alias_attribute :test_title, :title

  belongs_to :category

  def self.ordered_tests_titles_by_category(category_title)
    Test.joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
  end
end
