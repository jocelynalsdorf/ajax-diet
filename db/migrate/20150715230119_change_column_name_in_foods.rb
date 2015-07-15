class ChangeColumnNameInFoods < ActiveRecord::Migration
  def change
    rename_column :foods, :type, :food_name
  end
end
