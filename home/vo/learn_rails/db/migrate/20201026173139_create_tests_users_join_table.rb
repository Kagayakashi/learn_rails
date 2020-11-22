class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tests do |t|
      t.index [:user_id, :test_id], unique: true
    end
  end
end
