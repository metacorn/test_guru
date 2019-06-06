class BadgeCheckingService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.select do |b|
      send("check_#{b.rule_type}", b.id)
    end
  end

  private

  def check_on_the_first_try(badge_id)
    @badge = Badge.find(badge_id)

  end

  def check_all_by_category(badge_id)

  end

  def check_all_by_level(badge_id)

  end

  def check_overall(badge_id)

  end
end