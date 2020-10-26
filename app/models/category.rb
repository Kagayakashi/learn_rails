class Category < ApplicationRecord

  # Содержит в себе сущности:
  has_many :tests
end
