Rails.application.routes.draw do
  get 'services', to: 'sessions#services'

  get 'home#index'

  get 'session/new'

  get 'session/create'

  resources :services

  devise_for :users
end
