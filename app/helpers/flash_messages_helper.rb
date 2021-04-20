module FlashMessagesHelper
  def flash_message
    first_div second_div paragraph
  end

  private

  def first_div(content)
    tag.div content, class: 'row text-right mt-3'
  end

  def second_div(content)
    tag.div content, class: 'col col-md-12'
  end

  def paragraph
    if flash[:alert]
      tag.p flash[:alert], class: 'bg-warning text-dark flash border border-primary'.html_safe
    elsif flash[:notice]
      tag.p flash[:notice], class: 'bg-success text-light flash border border-primary'.html_safe
    elsif flash[:notice_url]
      tag.p flash[:notice_url].html_safe, class: 'bg-success text-light flash border border-primary'.html_safe
    end
  end
end
