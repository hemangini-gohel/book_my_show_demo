class ShowTime < ApplicationRecord
  belongs_to :movie
  has_many :ticket_bookings
  validates :start_time, :end_time, :total_seats, presence: true

  def available_seats
    total_seats - ticket_bookings.count
  end

  def next_available_seats(num_seats)
    booked_seats = ticket_bookings.pluck(:seat_number).compact.sort
    available = []
    (1..total_seats).each do |seat|
      available << seat unless booked_seats.include?(seat)
      break if available.size >= num_seats
    end
    available
  end
end
