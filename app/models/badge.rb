class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  enum rule_type: { overall: 3, all_by_level: 2, all_by_category: 1, by_the_first_time: 0 }  
end
