document.addEventListener('turbolinks:load', function() {
  var ruleTypeSelector = document.querySelector('#badge_rule_type')

  if (ruleTypeSelector) {
    ruleTypeSelector.addEventListener('change', ruleValueSelectorChange)
  }
})

function ruleValueSelectorChange() {
  var ruleTypeSelectorValue = document.querySelector('#badge_rule_type').value

  var ruleValueTestSelector = document.querySelector('.test-rule-value')
  var ruleValueCategorySelector = document.querySelector('.category-rule-value')
  var ruleValueTLevelSelector = document.querySelector('.level-rule-value')

  var ruleValueTestParagraph = document.querySelector('#test-rule-value')
  var ruleValueCategoryParagraph = document.querySelector('#category-rule-value')
  var ruleValueTLevelParagraph = document.querySelector('#level-rule-value')
  
  if (ruleTypeSelectorValue == "on_the_first_try") {
    console.log("on_the_first_try!")

    ruleValueTestSelector.id = "badge_rule_value"
    ruleValueCategorySelector.id = "badge_not_actual_rule_value"
    ruleValueTLevelSelector.id = "badge_not_actual_rule_value"

    ruleValueTestSelector.setAttribute("name", "badge[rule_value]")
    ruleValueCategorySelector.setAttribute("name", "badge[not_actual_rule_value]")
    ruleValueTLevelSelector.setAttribute("name", "badge[not_actual_rule_value]")

    ruleValueTestParagraph.classList.remove('hide')
    ruleValueCategoryParagraph.classList.add('hide')
    ruleValueTLevelParagraph.classList.add('hide')

  } else if (ruleTypeSelectorValue == "all_by_category") {
    console.log("all_by_category!")

    ruleValueTestSelector.id = "badge_not_actual_rule_value"
    ruleValueCategorySelector.id = "badge_rule_value"
    ruleValueTLevelSelector.id = "badge_not_actual_rule_value"

    ruleValueTestSelector.setAttribute("name", "badge[not_actual_rule_value]")
    ruleValueCategorySelector.setAttribute("name", "badge[rule_value]")
    ruleValueTLevelSelector.setAttribute("name", "badge[not_actual_rule_value]")

    ruleValueTestParagraph.classList.add('hide')
    ruleValueCategoryParagraph.classList.remove('hide')
    ruleValueTLevelParagraph.classList.add('hide')

  } else if (ruleTypeSelectorValue == "all_by_level") {
    console.log("all_by_level!")

    ruleValueTestSelector.id = "badge_not_actual_rule_value"
    ruleValueCategorySelector.id = "badge_not_actual_rule_value"
    ruleValueTLevelSelector.id = "badge_rule_value"

    ruleValueTestSelector.setAttribute("name", "badge[not_actual_rule_value]")
    ruleValueCategorySelector.setAttribute("name", "badge[not_actual_rule_value]")
    ruleValueTLevelSelector.setAttribute("name", "badge[rule_value]")

    ruleValueTestParagraph.classList.add('hide')
    ruleValueCategoryParagraph.classList.add('hide')
    ruleValueTLevelParagraph.classList.remove('hide')

  } else if (ruleTypeSelectorValue == "overall") {
    console.log("overall!")

    ruleValueTestSelector.id = "badge_not_actual_rule_value"
    ruleValueCategorySelector.id = "badge_not_actual_rule_value"
    ruleValueTLevelSelector.id = "badge_not_actual_rule_value"

    ruleValueTestSelector.setAttribute("name", "badge[not_actual_rule_value]")
    ruleValueCategorySelector.setAttribute("name", "badge[not_actual_rule_value]")
    ruleValueTLevelSelector.setAttribute("name", "badge[not_actual_rule_value]")

    ruleValueTestParagraph.classList.add('hide')
    ruleValueCategoryParagraph.classList.add('hide')
    ruleValueTLevelParagraph.classList.add('hide')

  }
}