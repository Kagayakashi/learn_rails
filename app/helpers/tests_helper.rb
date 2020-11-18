module TestsHelper

  TEST_LEVELS = {
    0 => :Легкий,
    1 => :Легкий,
    2 => :Средний,
    3 => :Средний,
    4 => :Средний,
  }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :Сложный
  end
  
  def test_header(test)
    text = test.persisted? ? "Редактирвоание теста #{test.title}" : "Создание нового теста"
    render inline: "<h1>#{text}</h1>"
  end
end