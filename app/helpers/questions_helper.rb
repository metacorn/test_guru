module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create new #{@test.title} question:"
    else
      "Edit #{question.test.title} Question:"
    end
  end
end
