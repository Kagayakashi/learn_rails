class DefaultColumnValue < ActiveRecord::Migration[6.0]
  def change
    change_column :answers, :correct, :boolean, :default => false
    change_column :users, :admin, :boolean, :default => false
    change_column :tests, :level, :integer, :default => 1
  end
end
