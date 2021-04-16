class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  validates :username, presence: true, uniqueness: true

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :creator_id
  has_many :gists, dependent: :destroy
  
  def admin?
    is_a?(Admin)
  end

  def tests_with_level(level)
    tests.where(level: level)
  end
  
  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
