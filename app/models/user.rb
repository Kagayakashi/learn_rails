class User < ApplicationRecord
  validates :email,
  format: { with: /(.+)@(.+)/ },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4 }


  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :creator_id
  
  has_secure_password
  
  def tests_with_level(level)
    tests.where(level: level)
  end
  
  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
