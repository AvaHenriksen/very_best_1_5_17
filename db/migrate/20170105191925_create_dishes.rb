class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :cuisine_id
      t.string :dish_name
      t.integer :venue_id

      t.timestamps

    end
  end
end
