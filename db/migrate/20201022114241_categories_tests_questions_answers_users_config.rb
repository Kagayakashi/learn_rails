class CategoriesTestsQuestionsAnswersUsersConfig < ActiveRecord::Migration[6.0]
  def change
    # Not Null
    change_column_null :categories, :title, false
    change_column_null :tests, :title, false
    change_column_null :questions, :body, false
    change_column_null :answers, :body, false
    change_column_null :users, :username, false
    change_column_null :users, :password, false
    
    # Default value
    change_column_default :tests, :level, from: 1, to: 3
    change_column_default :answers, :correct, from: true, to: false
    change_column_default :users, :admin, from: true, to: false
    
    # References
    add_reference :tests, :categories, foreign_key: true
    add_reference :questions, :tests, foreign_key: true
    add_reference :answers, :questions, foreign_key: true
  end
end
