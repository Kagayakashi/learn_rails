class Category < ApplicationRecord
  has_many :tests, dependent: :nullify
  
  default_scope { order(title: :asc) }
  
  validates :title, presence: true
end
