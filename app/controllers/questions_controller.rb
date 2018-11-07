class QuestionsController < ApplicationController
  before_action :get_test, only: %i[index create new]
  before_action :get_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    redirect_to test_url(@test)
  end

  def show
    @answers = @question.answers
  end

  def new
    @question = Question.new
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
