module FlashMessagesHelper
  def flash_bootstrap_class(key)
    case key
    when 'alert' then 'bg-warning text-dark'
    when 'notice' then 'bg-success text-light'
    when 'notice_url' then 'bg-success text-light'
    end
  end

  def render_flash_message(key, message)
    message = message.html_safe if key == 'notice_url'
    content_tag :p, message,
      class: "#{flash_bootstrap_class(key)} flash border border-primary"
  end
end
