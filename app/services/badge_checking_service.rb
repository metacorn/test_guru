class BadgeCheckingService
  include ActionController::Helpers
  include ActionController::Flash

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @rewarded_badges = []
  end

  def call
    Badge.select do |b|
      @badge = b
      send("check_#{b.rule_type}")
    end
    @rewarded_badges    
  end  

  private

  def check_on_the_first_try
    if @test.id.in?(Badge.on_the_first_try.pluck(:rule_value).map(&:to_i))
      if !@user.has_failed_passing?(@test) && !@user.badges.include?(@badge)
        @rewarded_badges << @badge
      end
    end
  end

  def check_all_by_category
    category = Category.find(@badge.rule_value)
    all_tests_by_category = Test.where('category_id = ?', category.id)
    if (all_tests_by_category - succesfully_passed_tests) == []
      @rewarded_badges << @badge
    end
  end

  def check_all_by_level
    level = @badge.rule_value
    all_tests_by_level = Test.where('level = ?', level)
    if (all_tests_by_level - succesfully_passed_tests) == []
      @rewarded_badges << @badge
    end
  end

  def check_overall
    all_tests = Test.all
    if (all_tests - succesfully_passed_tests) == []
      @rewarded_badges << @badge
    end
  end

  def succesfully_passed_tests
    if @user.badges.include?(@badge)
      last_user_badge_test_passage_id = @user.user_badges.where('badge_id = ?', @badge.id).last.test_passage_id
      successed_test_passages = TestPassage.where('user_id = ? AND id > ? AND successed = ?', @user.id, last_user_badge_test_passage_id, true)
    else
      successed_test_passages = TestPassage.where('successed = ?', true)
    end
    successed_passed_tests = successed_test_passages.pluck(:test_id).map { |test_id| Test.find(test_id) }
    successed_passed_tests.uniq
  end
end