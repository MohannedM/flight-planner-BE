Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  put '/flights/book/:id', to: "flights#book_flight"
  get '/flights/book', to: "flights#booked_flights"
  resources :flights, only: [:create, :index, :show, :destroy]
  root to: "application#home"
end
