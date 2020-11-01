class Answer < ApplicationRecord
  belongs_to :question
  
  scope :correct_answers, ->(questions) {
    joins(:question).where(correct: true, question: questions)
  }
end
