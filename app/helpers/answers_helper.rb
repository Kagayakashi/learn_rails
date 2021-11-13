module AnswersHelper
  def answer_header(answer:)
    text =
      if answer.persisted?
        I18n.t('helpers.custom.header.answer.editing')
      else
        I18n.t('helpers.custom.header.answer.creating')
      end
    content_tag :h1, text
  end
end
