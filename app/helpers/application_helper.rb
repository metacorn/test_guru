module ApplicationHelper
  def actual_year
    Time.current.year
  end

  def github_url(author, repo)
    link = "https://github.com/#{author}/#{repo}"
    link_to 'GitHub', link, target: "_blank"
  end

  def flash_show(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
end
