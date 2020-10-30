Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#dashboard'
  
  get 'dashboard' => 'dashboard#dashboard'
end
