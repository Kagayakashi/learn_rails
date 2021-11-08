class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    return # Индексы уже имеются в БД

    add_index :tests, :creator_id
    add_index :tests, :category_id
    add_index :tests, %[title level], unique: true

    add_index :questions, :test_id

    add_index :answers, :question_id

    add_index :test_passages, :test_id
    add_index :test_passages, :user_id
    add_index :test_passages, :question_id

    add_index :gists, :question_id
    add_index :gists, :user_id

    add_index :users, :email
    add_index :users, :confirmation_token
    add_index :users, :reset_password_token
  end
end
