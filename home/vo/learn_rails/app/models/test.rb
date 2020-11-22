class Test < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id, optional: true
  belongs_to :category, optional: true
  
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  
  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }
  
  scope :by_category, ->(category) do
    joins(:category).where(categories: { title: category })
  end
  
  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  

end
