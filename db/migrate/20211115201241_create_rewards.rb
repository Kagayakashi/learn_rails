class CreateRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :image_url
      t.string :rule_type

      t.timestamps
    end
  end
end
