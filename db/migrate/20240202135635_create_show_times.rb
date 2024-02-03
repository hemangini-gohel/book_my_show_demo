class CreateShowTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :show_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :total_seats
      t.integer :price
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
