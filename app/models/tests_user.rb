class TestsUser < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates :state, presence: true
end
