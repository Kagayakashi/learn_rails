class AddTypeAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    remove_column :users, :admin, :boolean
  end
end
