class Answer < ApplicationRecord

  # Содержится сам как сущность в:
  belongs_to :question
end
