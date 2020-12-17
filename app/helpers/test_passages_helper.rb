module TestPassagesHelper
  # Расчёт процента правильных ответов, если >= 85, то GOOD результат, иначе BAD (class result_bad/result_good)
  def answers_result(test_passage)
    "#{test_passage.correct_questions} (#{test_passage.correct_answers_percent}%)"
  end
  
  def questions_amount(test_passage)
    "Текущий вопрос #{test_passage.current_question_number}/#{test_passage.test.questions.count}"
  end
  
  def result_text(test_passage)
    return " Вы прошли тест!" if test_passage.test_result_good?
    " Вы не прошли тест!"
  end
  
  def result_class(test_passage)
    test_passage.test_result_good? ? "result_good" : "result_bad"
  end
end
