class Test < ApplicationRecord
  alias_attribute :test_title, :title

  def self.ordered_tests_titles_by_category(category_title)
    category_id = Category.find_by(category_title: category_title).id
    Test.joins("JOIN categories ON tests.category_id = categories.id").where(category_id: category_id).pluck(:test_title).sort.reverse!
  end
end
