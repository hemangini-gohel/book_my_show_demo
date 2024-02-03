# Getting started
To get started with the app, run below commands:

```
git clone https://github.com/hemangini-gohel/book_my_show_demo.git
cd book_my_show_demo
bundle install
rails db:setup
rails s
```

# Demo Video Link
https://vimeo.com/909444341/f7bfbf960b?share=copy

# Prerequisites
* Ruby 3
* Rails 7
* PostgreSQL

<h2> Note:</h2>
<b> Please refer the seeds.rb to create records with command line(rails console)</b>

Create a movie

```
Movie.create(title: 'Movie Title', genre: 'Demo genre' , description: 'Movie Description')
```

Create a Show Time 

```
ShowTime.create(
  movie: movie1, # Pass any movie
  start_time: DateTime.new(2024, 2, 2, 16, 30),
  end_time: DateTime.new(2024, 2, 2, 18, 0),
  total_seats: 30,
  price: 200
)
```

Create a User

```
User.create(email: 'user1@example.com', password: 'test123')
```

Perform Ticket Booking

```
TicketBooking.create(seat_number: 1, show_time: ShowTime.first, user: user) # pass user 
TicketBooking.create(seat_number: 2, show_time: ShowTime.first, user: user) # pass user 
```

Perform Ticket Cancelling
```
TicketBooking.find(booking_id).destroy
```

Check Available Seats with ShowTime
```
ShowTime.find(show_time_id).available_seats
```

# Problem Statement

Movie Initialization:
Define a list of available movies with details such as title, genre, and show timings.

User Booking:
Implement a method for users to book tickets for a specific movie and showtime.
Keep track of the number of available seats for each show.

Seat Allocation:
When a user books a ticket, allocate the next available seat for the chosen show.

Ticket Cancellation:
Implement a method for users to cancel their booked tickets.
Make the canceled seats available for booking again.

Booking Confirmation and Display:
Provide a booking confirmation with details such as movie title, showtime, and seat number.
Display the current status of booked and available seats for each show.

Multiple Movies and Shows:
Extend the system to support multiple movies with different show timings.
