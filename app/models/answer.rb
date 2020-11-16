class Answer < ApplicationRecord
  belongs_to :question
  
  scope :correct, -> {
    where(correct: true)
  }
  
  validates :body, presence: true
  
  before_validation :validate_maximum_answers, on: :create
  
  private
  def validate_maximum_answers
    if question.answers.count >= 4
      errors.add(:question, 'максимум может иметь  4 ответа.')
    end
  end
end
