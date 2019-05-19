class TestPassagesController < ApplicationController

  before_action :get_test_passage, only: %i[show result update]

  def show
  end

  def result
  end

  def update
  end

  private

  def get_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
