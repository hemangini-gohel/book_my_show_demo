class CreateTicketBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_bookings do |t|
      t.integer :seat_number
      t.references :show_time, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
