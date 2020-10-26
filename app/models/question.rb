class Question < ApplicationRecord
  
  # Содержит в себе сущности:
  has_many :answers
  
  # Содержится сам как сущность в:
  belongs_to :test
end
