class User < ApplicationRecord
  has_many :tests
  
  has_many :tests_users, dependent: :destroy
  has_many :testings, through: :tests_users, source: :test
  
  def tests_with_level(level)
    tests.find_by(level: level)
  end
end
