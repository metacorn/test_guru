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
      "Passing #{badge.rule_value} test on the first try"
    when "all_by_category"
      "Passing all tests of #{badge.rule_value} category"
    when "all_by_level"
      "Passing all tests of #{badge.rule_value} level"
    when "overall"
      "Passing all tests"
    end      
  end
end