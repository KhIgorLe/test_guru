module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo, options)
    link_to repo.camelize, "https://github.com/#{author}/#{repo}", options
  end

  def flash_message(alert)
    if alert
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
