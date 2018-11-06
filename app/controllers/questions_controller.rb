class QuestionsController < ApplicationController
  before_action :get_test, only: %i[index create]
  before_action :get_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.pluck(:body)
    render plain: questions.join("\n")
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: "Question was created!"
    else
      render plain: "Question was not created!"
    end
  end

  def destroy
    @question.destroy
    render plain: "Question was deleted!"
  end

  private

  def get_test
    @test = Test.find(params[:test_id])
  end

  def get_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "This question was not found!"
  end
end
