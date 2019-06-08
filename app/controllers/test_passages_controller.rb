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
        rewarding
        TestsMailer.completed_test(@test_passage).deliver_now
      end      
      @test_passage.save
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

  def rewarding
    rewarded_badges = BadgeCheckingService.new(@test_passage).call
        if rewarded_badges.present?
          rewarded_badges.each do |badge|
            UserBadge.create(user_id: current_user.id,
                             badge_id: badge.id,
                             test_passage_id: @test_passage.id)
          end
          badges_titles = rewarded_badges.map(&:title).join(", ")
          flash[:notice] = t('.badges', count: rewarded_badges.length, badges_titles: badges_titles)
        end
  end

  private

  def get_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end