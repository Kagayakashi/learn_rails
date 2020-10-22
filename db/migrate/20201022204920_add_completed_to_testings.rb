class AddCompletedToTestings < ActiveRecord::Migration[6.0]
  def change
    add_column :testings, :completed, :boolean
  end
end
