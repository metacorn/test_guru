class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  enum rule_type: { overall: 3, all_by_level: 2, all_by_category: 1, by_the_first_time: 0 }

  validates :title, presence: true, uniqueness: true
  validates :image, presence: true, uniqueness: true
  validates :rule_type, presence: true, inclusion: { in: rule_types.keys }
  validate :valid_rule_value

  def valid_rule_value
    if rule_type == "all_by_level"
      levels = Test.distinct.pluck(:level).map(&:to_s)
      if !rule_value.in?(levels)
        errors.add(:level, "Invalid level value.")
      end
    elsif rule_type == "all_by_category"
      categories = Category.distinct.pluck(:title)
      if !rule_value.in?(categories)
        errors.add(:category, "Invalid category title.")
      end
    end
  end
end
