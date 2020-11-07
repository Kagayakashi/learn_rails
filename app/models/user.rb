class User < ApplicationRecord
  has_many :tests
  
  has_many :tests_users, dependent: :destroy
  has_many :testings, through: :tests_users, source: :test
  
  validates :username, :password, :email, presence: true
  
  def tests_with_level(level)
    tests.where(level: level)
  end
end
