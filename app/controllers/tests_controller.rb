class TestsController < ApplicationController
  before_action :get_test, only: %i[show]
  before_action :get_questions, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
  end

  private

  def get_test
    @test = Test.find(params[:id])
  end

  def get_questions
    @questions = @test.questions
  end
end
