HotelReservationApp::Application.routes.draw do
  root to: 'rooms#index'

  resources :rooms, only: [:index, :show] do
    resources :reservations, only: [:create]
  end
  
  resources :reservations, only: [:index, :destroy]
  
  devise_for :users
end
