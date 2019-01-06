module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo, options)
    link_to repo.camelize, "https://github.com/#{author}/#{repo}", options
  end
end
