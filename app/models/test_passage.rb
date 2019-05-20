class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_next_question

  def completed?
    current_question.nil?
  end

  def successed?
    correct_answers_percentage > 85
  end

  def number_of_all
    "#{test.questions.size - remaining_questions.count}/#{test.questions.size}"
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def correct_answers_percentage
    self.correct_questions * 100 / test.questions.size
  end

  def remaining_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_answers_count == correct_answers.where(id: answer_ids).count && correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_next_question
    self.current_question = remaining_questions.first
  end
end
