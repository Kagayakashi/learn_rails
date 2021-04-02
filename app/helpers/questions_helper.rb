module QuestionsHelper
  def question_header(question:, test:)
    if question.persisted?
      text = "Редактирвоание вопроса теста #{test.title}"
    else
      text = "Создание нового вопроса теста #{test.title}"
    end

    content_tag :h1, text
  end
end
