class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_amount, on: :create

  def validate_answers_amount
    errors.add(:answers_amount, '... Question can not have more than four answers') if self.question.answers.size >= 4
  end
end
