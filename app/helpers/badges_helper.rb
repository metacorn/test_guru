module BadgesHelper
  def show_image(badge)
    image = badge.image
    color = badge.color
    height = image == "thumbsup" ? 18 : 24
    "<%= octicon '#{image}', color: '#{color}', height: '#{height}' %>"
  end

  def show_rule(badge)
    case badge.rule_type
    when "on_the_first_try"
      test = Test.find(badge.rule_value)
      "Passing '#{test.title}' (level #{test.level}) test on the first try"
    when "all_by_category"
      category = Category.find(badge.rule_value)
      "Passing all tests of '#{category.title}' category"
    when "all_by_level"
      "Passing all tests of #{badge.rule_value} level"
    when "overall"
      "Passing all tests"
    end      
  end

  def show_user_badges
    html_erb_string = ""
    badges = current_user.user_badges.pluck(:badge_id).map { |badge_id| Badge.find(badge_id) }
    badges.each do |badge|
      html_erb_string += show_image(badge) + "\n"
    end
    html_erb_string
  end
end