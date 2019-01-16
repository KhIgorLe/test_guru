module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo, options)
    link_to repo.camelize, "https://github.com/#{author}/#{repo}", options
  end

  def flash_message
    flash.map do |key, value|
      content_tag(:p, value, class: "flash #{key}")
    end.join.html_safe
  end
end
