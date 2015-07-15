class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.column :user_id, :integer
      t.column :type, :string
      t.column :calories, :integer

      t.timestamps
    end
  end
end
