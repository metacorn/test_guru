class QuestionsController < ApplicationController
  before_action :get_test, only: %i[index]

  def index
    questions = @test.questions.pluck(:body)
    render plain: questions.join("\n")
  end

  private

  def get_test
    @test = Test.find(params[:test_id])
  end
end
