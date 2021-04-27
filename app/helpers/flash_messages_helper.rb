module FlashMessagesHelper
  CLASSES = {
    alert: 'bg-warning text-dark',
    notice: 'bg-success text-light',
    notice_url: 'bg-success text-light',
  }.freeze

  def flash_message(type)
    tag.p flash[type].html_safe, class: "#{CLASSES[type]} flash border border-primary'".html_safe if flash[type]
  end
end
