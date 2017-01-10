class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :cuisine_id
      t.string :dish_name

      t.timestamps

    end
  end
end