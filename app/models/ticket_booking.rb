class TicketBooking < ApplicationRecord
  attr_accessor :num_tickets

  belongs_to :show_time
  belongs_to :user
end
