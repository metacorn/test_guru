module QuestionsHelper
  def question_header(question, test)
    if question.body.nil?
      "Create new #{test.title} question:"
    else
      "Edit #{test.title} Question:"
    end
  end
end
