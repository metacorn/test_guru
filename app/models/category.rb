class Category < ApplicationRecord
  alias_attribute :category_title, :title

  has_many :tests

  default_scope { order(:title) }

  validates :title, presence: true
end
