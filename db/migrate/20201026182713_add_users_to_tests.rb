class AddUsersToTests < ActiveRecord::Migration[6.0]
  def change
    # References
    add_reference :tests, :creator, foreign_key: { to_table: :users }
  end
end
