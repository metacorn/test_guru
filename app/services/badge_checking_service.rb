class BadgeCheckingService

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
    if @rewarded_badges.length > 0

    end
  end

  def reward_user(badge)
    user_badge = UserBadge.new( user_id: @user.id,
                                badge_id: badge.id,
                                test_passage_id: @test_passage.id)
    if user_badge.save
      @rewarded_badges << badge
    end
  end

  private

  def check_on_the_first_try
    if @test.id.in?(Badge.on_the_first_try.pluck(:rule_value).map(&:to_i))
      if !@user.has_failure?(@test) && !@user.has_badge?(@badge)
        reward_user(@badge)
      end
    end
  end

  def check_all_by_category
    category = Category.find(@badge.rule_value)
    all_tests_by_category = Test.where('category_id = ?', category.id)
    if (all_tests_by_category - succesfully_passed_tests()) == []
      reward_user(@badge)
    end
  end

  def check_all_by_level
    level = @badge.rule_value
    all_tests_by_level = Test.where('level = ?', level)
    if (all_tests_by_level - succesfully_passed_tests()) == []
      reward_user(@badge)
    end
  end

  def check_overall
    all_tests = Test.all
    if (all_tests - succesfully_passed_tests()) == []
      reward_user(@badge)
    end
  end

  # returns array of successfully passed tests since last gaining this badge (or since the beginning if user has not this badge)
  def succesfully_passed_tests
    if @user.has_badge?(@badge)
      last_user_badge_test_passage_id = @user.user_badges.where('badge_id = ?', @badge.id).last.test_passage_id
      successed_test_passages = TestPassage.where('id > ? AND successed = ?', last_user_badge_test_passage_id, true)
    else
      successed_test_passages = TestPassage.where('successed = ?', true)
    end
    successed_passed_tests = successed_test_passages.pluck(:test_id).map { |test_id| Test.find(test_id) }
    successed_passed_tests.uniq!
  end
 
end