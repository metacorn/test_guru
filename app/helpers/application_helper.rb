module ApplicationHelper
  def actual_year
    Time.current.year
  end

  def github_url(author, repo)
    link = "https://github.com/#{author}/#{repo}"
    link_to 'GitHub', link, target: "_blank"
  end

  def flash_class(key)
    case key
    when :alert
      "alert alert-danger"
    when :notice
      "alert alert-success"
    else
      "alert alert-primary"
    end
  end
end
