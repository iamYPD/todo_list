class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :todo_lists, :descriptiontion, :description
  end
end
