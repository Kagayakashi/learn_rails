class Test < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :creator, :class_name => 'User'
  belongs_to :category, optional: true
  
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users
  has_many :questions, dependent: :destroy
  
  scope :easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :normal, -> { where(level: 2..4).order(created_at: :desc) }
  scope :hard, -> { where(level: 5..).order(created_at: :desc) }
  
  scope :by_category_desc, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }
  
  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
