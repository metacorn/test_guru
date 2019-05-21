class TestsController < ApplicationController

  before_action :authenticate_user!, except: :index
  before_action :get_test, only: %i[show update destroy start]
  before_action :get_user, only: %i[start]

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

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def get_test
    @test = Test.find(params[:id])
  end

  def get_questions
    @questions = @test.questions
  end

  def get_user
    @user = current_user
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
