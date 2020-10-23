class AddReferenceToTestings < ActiveRecord::Migration[6.0]
  def change
    # References
    add_reference :testings, :test, foreign_key: true
    add_reference :testings, :user, foreign_key: true
  end
end
