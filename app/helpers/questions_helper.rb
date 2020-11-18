module QuestionsHelper
  def question_header(hash)
    text = hash[:question].persisted? ? "Редактирвоание вопроса теста #{hash[:question].test.title}" : "Создание нового вопроса теста #{hash[:test].title}"
    render inline: "<h1>#{text}</h1>"
  end
end
