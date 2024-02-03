# frozen_string_literal: true

class TicketBookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_show_time, except: %i[cancel_multiple user_ticket_bookings]

  def new
    @ticket_booking = @show_time.ticket_bookings.new
  end

  def create
    num_tickets = params[:ticket_booking][:num_tickets].to_i

    if num_tickets.positive? && @show_time.available_seats >= num_tickets
      seat_numbers = @show_time.next_available_seats(num_tickets)
      bookings = []

      seat_numbers.each do |seat_number|
        bookings << @show_time.ticket_bookings.new(ticket_booking_params.merge(seat_number: seat_number, user: current_user))
      end

      if bookings.all?(&:save)
        redirect_to movie_show_times_path(@movie), notice: "#{num_tickets} tickets booked successfully"
      else
        redirect_to movie_show_times_path(@movie), alert: 'Failed to book tickets'
      end
    else
      redirect_to movie_show_times_path(@movie), alert: 'Not enough available seats for the requested number of tickets'
    end
  end

  def cancel_multiple
    booking_ids = params[:booking_ids]
    if booking_ids.present?
      TicketBooking.where(id: booking_ids).destroy_all
      flash[:notice] = 'Selected bookings were successfully cancelled'
    else
      flash[:alert] = 'No bookings selected for cancellation'
    end
    redirect_to root_path
  end

  def user_ticket_bookings
    @user_bookings = current_user.ticket_bookings.includes(:show_time)
  end

  private

  def set_show_time
    @movie = Movie.find(params[:movie_id])
    @show_time = @movie.show_times.find(params[:show_time_id])
  end

  def ticket_booking_params
    params.require(:ticket_booking).permit(:num_tickets)
  end
end
