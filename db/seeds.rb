# frozen_string_literal: true

require 'faker'

# Create movies with fake data
movie1 = Movie.create(title: Faker::Book.title, genre: Faker::Book.genre, description: Faker::Lorem.sentence)
movie2 = Movie.create(title: Faker::Book.title, genre: Faker::Book.genre, description: Faker::Lorem.sentence)

# Create show times with fake data
ShowTime.create(
  movie: movie1,
  start_time: Faker::Time.forward(days: 30, period: :evening),
  end_time: Faker::Time.forward(days: 30, period: :night),
  total_seats: Faker::Number.between(from: 20, to: 50),
  price: Faker::Number.between(from: 100, to: 500)
)

ShowTime.create(
  movie: movie1,
  start_time: Faker::Time.forward(days: 30, period: :evening),
  end_time: Faker::Time.forward(days: 30, period: :night),
  total_seats: Faker::Number.between(from: 20, to: 50),
  price: Faker::Number.between(from: 100, to: 500)
)

ShowTime.create(
  movie: movie2,
  start_time: Faker::Time.forward(days: 30, period: :evening),
  end_time: Faker::Time.forward(days: 30, period: :night),
  total_seats: Faker::Number.between(from: 20, to: 50),
  price: Faker::Number.between(from: 100, to: 500)
)

ShowTime.create(
  movie: movie2,
  start_time: Faker::Time.forward(days: 30, period: :evening),
  end_time: Faker::Time.forward(days: 30, period: :night),
  total_seats: Faker::Number.between(from: 20, to: 50),
  price: Faker::Number.between(from: 100, to: 500)
)

# Create users with fake data
user1 = User.create(email: 'user1@example.com', password: 'test123')
user2 = User.create(email: 'user2@example.com', password: 'test123')

# Create ticket bookings with fake data
TicketBooking.create(seat_number: 1, show_time: ShowTime.first, user: user1)
TicketBooking.create(seat_number: 2, show_time: ShowTime.first, user: user1)

puts 'Seed data created successfully!'
