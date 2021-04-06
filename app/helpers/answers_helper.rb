module AnswersHelper
  def answer_header(answer:)
    text = 
      if answer.persisted?
        "Редактирвоание ответа вопроса #{answer.question.body}"
      else
        "Создание нового ответа вопроса #{answer.question.body}"
      end

    content_tag :h1, text
  end
end
