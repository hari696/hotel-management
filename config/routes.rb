Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'dashboard#dashboard'
  
  get 'dashboard' => 'dashboard#dashboard'
end
