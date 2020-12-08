module TestPassagesHelper
  # Расчёт процента правильных ответов, если >= 85, то GOOD результат, иначе BAD (class result_bad/result_good)
  def test_passage_result(test_passage)
    question_amount = test_passage.test.questions.count

    percent = (test_passage.correct_questions.to_f / question_amount.to_f * 100).to_i
    result_class = percent >= 85 ? "result_good" : "result_bad"

    result_percent = "#{test_passage.correct_questions} (#{percent}%)"
    result_text = test_result_good?(percent >= 85)

    result = content_tag :span, "Количество правильных ответов: ", class: 'result_text_begin'
    result += content_tag :span, result_percent, class: "result_percent #{result_class}"
    result += content_tag :span, result_text, class: "result_text_end #{result_class}"
  end
  
  def questions_amount(test_passage)
    "Текущий вопрос #{test_passage.current_question_number}/#{test_passage.test.questions.count}"
  end
  
  private
  
  def test_result_good?(result_good)
    return " Вы прошли тест!" if result_good
    " Вы не прошли тест!"
  end
end
