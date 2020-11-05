class Answer < ApplicationRecord
  belongs_to :question
  
  scope :correct, -> {
    where(correct: true)
  }
  
  validates :body, presence: true
  
  validate :validate_maximum_answers

  def validate_maximum_answers
    if question.answers.length == 4
      errors.add(:question, 'Всего может быть 4 ответа у вопроса.')
    end
  end
end
