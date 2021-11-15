class CreateIssuedRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :issued_rewards do |t|
      t.string :test
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
