class Test < ApplicationRecord
  alias_attribute :test_title, :title
  #alias_attribute :author_id, :user_id

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }
  scope :by_level, -> (level) { where(level: level) }

  validates :title, presence: true,
                    uniqueness: { scope: :level, message: '... values of title and level must be unique!' }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :time_limit,  presence: true,
                          numericality: { only_integer: true,
                                          greater_than_or_equal_to: 1,
                                          less_than_or_equal_to: 60 }

  def self.ordered_tests_titles_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
