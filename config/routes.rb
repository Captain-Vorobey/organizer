Rails.application.routes.draw do
  get 'services', to: 'sessions#services'

  get 'session/new'

  get 'session/create'

  get 'home/index'

  root 'home#index'

  resources :services

  devise_for :users
end
