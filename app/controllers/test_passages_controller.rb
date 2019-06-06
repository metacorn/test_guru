class TestPassagesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :get_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      if @test_passage.successed?
        @test_passage.successed = true
        @test_passage.save
      end
      BadgeCheckingService.new(@test_passage).call
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    if service.success?
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
      flash_options = { notice: t('.success', gist_html_url: result.html_url) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def get_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
