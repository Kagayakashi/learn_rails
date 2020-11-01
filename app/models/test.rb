class Test < ApplicationRecord
  belongs_to :creator, :class_name => 'User'
  belongs_to :category, optional: true
  
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users
  has_many :questions, dependent: :destroy

  default_scope { order(created_at: :desc) }
  
  scope :easy, -> { where(level: 0..1).order(created_at: :desc) }
  
  validates :title, presence: true,
                    uniqueness: true
  validates :level, numericality: { only_integer: true }

  def self.tests_name_with_category_desc(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  end
end
