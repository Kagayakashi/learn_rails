class User < ApplicationRecord
  has_many :tests
  
  has_many :tests_users, dependent: :destroy
  has_many :testings, through: :tests_users, source: :test
  
  scope :tests_by_level, ->(level) {
    joins(:testings).where(tests: { level: level })
  }
end
