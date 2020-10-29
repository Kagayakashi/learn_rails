class User < ApplicationRecord
  belongs_to :test
  
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  
  def tests_with_level(level)
    tests.find_by(level: level)
  end
end
