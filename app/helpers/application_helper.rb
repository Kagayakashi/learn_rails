module ApplicationHelper
  def footer_year(first_year)
    return Time.current.year if first_year == Time.current.year
    "2020-#{Time.current.year}"
  end
  
  def link_to_github(author, repo, link_name)
    link_to link_name, "https://github.com/#{author}/#{repo}", rel: 'nofollow', target: :_blank
  end

  def link_to_gist(author, hash, link_name)
    link_to link_name, "https://gist.github.com/#{author}/#{hash}", rel: 'nofollow', target: :_blank,
      class: 'list-group-item list-group-item-action'
  end
end
