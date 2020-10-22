class DropTableTestsQuestionsCategoriesAnswersUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :answers
    drop_table :categories
    drop_table :questions
    drop_table :tests
    drop_table :users
  end
end
