class ChangeColumnDefaultToTestings < ActiveRecord::Migration[6.0]
  def change
    # Default value
    change_column_default :testings, :completed, from: nil, to: false
  end
end
