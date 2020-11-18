module AnswersHelper
  def answer_header(answer:, question:)
    if answer.persisted?
      text = "Редактирвоание ответа вопроса #{answer.question.body}"
    else
      text = "Создание нового ответа вопроса #{question.body}"
    end

    content_tag :h1, text
  end
end
