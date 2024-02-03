# Getting started
To get started with the app, first clone the repo and `cd` into the directory:

```
git clone https://github.com/hemangini-gohel/book_my_show_demo.git
cd book_my_show_demo
bundle install
rails db:setup
rails s
```

# Demo Link
https://vimeo.com/909444341/f7bfbf960b?share=copy

# Prerequisites
* Ruby 3
* Rails 7
* PostgreSQL

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
