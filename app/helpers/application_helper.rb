module ApplicationHelper
  def book_tickets_link(show_time)
    if user_signed_in?
      link_to 'Book Tickets', new_movie_show_time_ticket_booking_path(show_time.movie, show_time), class: 'btn btn-primary'
    else
      link_to 'Book Tickets', new_user_session_path, class: 'btn btn-primary'
    end
  end

  def format_date(start_time, end_time)
    "#{start_time.strftime('%d/%m/%Y, %H:%M')} - #{end_time.strftime('%H:%M')}"
  end
end
