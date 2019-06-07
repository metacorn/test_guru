class Badge < ApplicationRecord
  enum image: { star: 0, thumbsup: 1, heart: 2 }
  enum color: { green: 0, blue: 1, red: 2 }
  enum rule_type: { on_the_first_try: 0, all_by_category: 1, all_by_level: 2, overall: 3 } 

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true, uniqueness: true
  validates :image, presence: true, inclusion: { in: images.keys }
  validates :color, presence: true, inclusion: { in: colors.keys }
  validates :rule_type, presence: true, inclusion: { in: rule_types.keys }
  validate :valid_rule_value

  def valid_rule_value
    case rule_type
    when "on_the_first_try"
      tests = Test.all.pluck(:id)
      if !rule_value.to_i.in?(tests)
        errors.add(:test, "Invalid test id.")
      end
    when "all_by_level"
      levels = Test.distinct.pluck(:level).map(&:to_s)
      if !rule_value.in?(levels)
        errors.add(:level, "Invalid level value.")
      end
    when "all_by_category"
      categories = Category.all.pluck(:id).map(&:to_s)
      if !rule_value.in?(categories)
        errors.add(:category, "Invalid category id.")
      end
    end
  end
end
