module ApplicationHelper
  def footer_year(first_year)
    return Time.current.year if first_year == Time.current.year
    "2020-#{Time.current.year}"
  end
  
  def link_to_github(author, repo, link_name)
    link_to link_name, "https://github.com/#{author}/#{repo}", rel: 'nofollow', target: :_blank
  end

  def flash_bootstrap_class(key)
    case key
    when 'alert' then 'bg-warning text-dark'
    when 'notice' then 'bg-success text-light'
    end
  end
end
