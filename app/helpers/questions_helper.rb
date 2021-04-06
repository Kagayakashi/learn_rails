module QuestionsHelper
  def question_header(question:)
    if question.persisted?
      text = "Редактирвоание вопроса теста #{question.test.title}"
    else
      text = "Создание нового вопроса теста #{question.test.title}"
    end

    content_tag :h1, text
  end
end
