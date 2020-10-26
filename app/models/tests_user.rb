# => tests_users => TestsUser
class TestsUser < ApplicationRecord

  belongs_to :user
  belongs_to :test
  
  
end
