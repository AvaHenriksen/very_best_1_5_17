class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :neighborhood_id
      t.string :venue_name
      t.string :address
      t.integer :dish_id

      t.timestamps

    end
  end
end
