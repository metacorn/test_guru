module ApplicationHelper
  def actual_year
    Time.now.year
  end

  def github_url(author, repo)
    link = 'https://github.com/' + author + '/' + repo
    link_to 'GitHub', link
  end
end
