class ChangeColumnDefaultToTestings < ActiveRecord::Migration[6.0]
  def change
    change_column_default :testings, :completed, from: nil, to: false
  end
end
