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

  def edit
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to test_url(@test)
    else
      redirect_to new_test_question_url(@test)
    end
  end

  def destroy
    @question.destroy
    redirect_to test_url(@test)
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
