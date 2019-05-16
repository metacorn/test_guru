class TestsController < ApplicationController
  before_action :get_test, only: %i[show]
  before_action :get_questions, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def get_test
    @test = Test.find(params[:id])
  end

  def get_questions
    @questions = @test.questions
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
