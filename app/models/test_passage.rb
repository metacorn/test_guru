class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def completed?
    current_question.nil? || expired?
  end

  def successed?
    correct_answers_percentage > 85
  end

  def number_of_all
    test.questions.size - remaining_questions.count
  end

  def total_questions
    test.questions.size
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
    if current_question.nil?
      test.questions.order(:id)
    else
      test.questions.order(:id).where('id > ?', current_question.id)
    end
  end

  def expired?
    Time.now - created_at > (test.time_limit * 60) 
  end

  def time_left
    ((test.time_limit * 60) - (Time.now - created_at)).div(1)
  end

  private

  def before_validation_set_current_question
    self.current_question = remaining_questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_answers_count == correct_answers.where(id: answer_ids).count && correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end  
end
