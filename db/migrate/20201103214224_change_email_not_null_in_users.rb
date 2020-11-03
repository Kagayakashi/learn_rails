class ChangeEmailNotNullInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :email, from: nil, to: false
  end
end
