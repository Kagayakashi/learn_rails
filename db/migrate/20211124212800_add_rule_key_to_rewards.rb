class AddRuleKeyToRewards < ActiveRecord::Migration[6.0]
  def change
    add_column :rewards, :rule_key, :bigint
  end
end
