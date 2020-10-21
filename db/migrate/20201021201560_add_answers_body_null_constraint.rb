class AddAnswersBodyNullConstraint < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :body, :string
    change_column_null(:answers, :body, false)
  end
end
