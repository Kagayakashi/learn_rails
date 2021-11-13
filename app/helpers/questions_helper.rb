module QuestionsHelper
  def question_header(question:)
    text = if question.persisted?
             I18n.t('helpers.custom.header.question.editing')
           else
             I18n.t('helpers.custom.header.question.creating')
           end
    content_tag :h1, text
  end
end
