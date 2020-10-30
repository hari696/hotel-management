Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'dashboard#dashboard'
  
  get 'dashboard' => 'dashboard#dashboard'
  get 'search' => 'dashboard#search'
  
  resources :customers do
    get 'search', on: :collection
  end
  resources :booked_rooms
end
