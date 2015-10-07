Rails.application.routes.draw do
  get 'cards/new'

  get 'cards/destroy'

  get 'cards/update'

  get 'users/index'

  get 'users/new'

  get 'users/destroy'

  get 'users/update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

  resources :users
  resources :cards
  resources :sessions
  
end
