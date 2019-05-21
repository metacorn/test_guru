module SessionsHelper
  def flash_show(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
end
