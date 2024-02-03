Rails.application.routes.draw do
  devise_for :users

  resources :movies, only: [:index] do
    resources :show_times, only: [:index] do
      resources :ticket_bookings, only: [:new, :create]
    end
  end
  get 'user_ticket_bookings', to: 'ticket_bookings#user_ticket_bookings'
  post 'ticket_bookings/cancel_multiple', to: 'ticket_bookings#cancel_multiple', as: 'cancel_multiple_ticket_bookings'
  root 'movies#index'
end
