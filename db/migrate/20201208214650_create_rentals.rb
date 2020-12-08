class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.integer "cat_id", null: false
      t.date "start_date", null: false
      t.date "end_date", null: false
      t.string "status", null: false

      t.timestamps
    end
  end
end
