Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  get '/about', to: 'home#about'

  get '/basket', to: 'basket#show'

  get '/companies/:id', to: 'company#index'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/services/:id/orders/new', to: 'order#new'

  post '/services/:id/orders/new', to: 'order#create'

  resources :services do
    resource :order

    collection do
      get :search
    end
  end

  resources :companies
  resources :orders

  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
