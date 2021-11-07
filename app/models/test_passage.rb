class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true, foreign_key: :question_id

  before_validation :before_validation_set_first_question, on: :create

  MINIMUM_GOOD_RESULT = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  def completed?
    self.current_question.nil?
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', self.current_question.id).count
  end
  
  def correct_answers_percent
    (self.correct_questions.to_f / test.questions.count.to_f * 100).to_i
  end
  
  def test_result_good?
    correct_answers_percent >= MINIMUM_GOOD_RESULT
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    self.correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    self.current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', self.current_question.id).first
  end
end
