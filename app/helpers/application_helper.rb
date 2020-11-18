module ApplicationHelper

  def footer_year(first_year)
    return Time.current.year if first_year == Time.current.year
    "2020-#{Time.current.year}"
  end

end
