module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo, options)
    link_to repo.camelize, "https://github.com/#{author}/#{repo}", options
  end

  def flash_class(key)
    case key
    when 'notice'
      'alert alert-info'
    when 'success'
      'alert alert-success'
    when 'warning', 'alert'
      'alert alert-warning'
    end
  end
end
