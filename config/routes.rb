Rails.application.routes.draw do

  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'addcard' => 'users#addcard', as: :add_card
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

  resources :users
  resources :cards
  resources :sessions
  resources :user_cards
  
end
