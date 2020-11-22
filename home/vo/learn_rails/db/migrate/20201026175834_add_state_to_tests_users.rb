class AddStateToTestsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :tests_users, :state, :string
  end
end
