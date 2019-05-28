module ApplicationHelper

  BOOTSTRAP_FLASH = { alert: 'alert alert-danger', notice: 'alert alert-primary' }
  DEFAULT_BOOTSTRAP_FLASH = 'alert alert-primary'

  def actual_year
    Time.current.year
  end

  def github_url(author, repo)
    link = "https://github.com/#{author}/#{repo}"
    link_to 'GitHub', link, target: "_blank"
  end

  def flash_class(key)
    BOOTSTRAP_FLASH[key] || DEFAULT_BOOTSTRAP_FLASH
  end
end
