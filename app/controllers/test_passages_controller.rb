class TestPassagesController < ApplicationController

  before_action :get_test, only: %i[show]

  def show
  end

  def result
  end

  def update
  end

  private

  def get_test
    @test = TestPassage.find(params[:id]).test
  end

end
