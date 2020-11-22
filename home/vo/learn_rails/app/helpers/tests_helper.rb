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
  
  def test_header(test:)
    if test.persisted?
      text = "Редактирвоание теста #{test.title}"
    else
      text = "Создание нового теста"
    end

    content_tag :h1, text
  end
end
