class AddFinishedCompletedToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :finished, :boolean
    add_column :test_passages, :completed, :boolean
  end
end
