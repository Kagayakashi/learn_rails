module TestPassagesHelper
  # Расчёт процента правильных ответов, если >= 85
  def answers_result(test_passage)
    "#{test_passage.correct_questions} (#{test_passage.correct_answers_percent}%)"
  end

  def questions_amount(test_passage)
    "#{I18n.t('helpers.custom.label.test_passage.current_question')} #{test_passage.current_question_number}/#{test_passage.test.questions.count}"
  end

  def result_text(test_passage)
    return " #{I18n.t('helpers.custom.label.test_passage.passed')}" if test_passage.test_result_good?
    " #{I18n.t('helpers.custom.label.test_passage.not_passed')}"
  end

  def result_class(test_passage)
    test_passage.test_result_good? ? "result_good" : "result_bad"
  end
end
