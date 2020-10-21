class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.0]
  
  # При активации делает колонку title not null
  def change
    change_column_null(:tests, :title, false)
  end
  
  #def up
  #  change_column_null(:tests, :title, false)
  #end
  
  #def down
  #  change_column_null(:tests, :title, true)
  #end
end
