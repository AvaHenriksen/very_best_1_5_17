class CreateUserbookmarks < ActiveRecord::Migration
  def change
    create_table :userbookmarks do |t|
      t.integer :user_id
      t.integer :bookmark_id

      t.timestamps

    end
  end
end
