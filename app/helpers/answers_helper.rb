module AnswersHelper
  def answer_header(hash)
    text = hash[:answer].persisted? ? "Редактирвоание ответа вопроса #{hash[:answer].question.body}" : "Создание нового ответа вопроса #{hash[:question].body}"
    render inline: "<h1>#{text}</h1>"
  end
end
