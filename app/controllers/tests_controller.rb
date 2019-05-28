class TestsController < ApplicationController

  before_action :authenticate_user!, except: :index
  before_action :get_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test), notice: t('.success')
  end

  private

  def get_test
    @test = Test.find(params[:id])
  end

end
