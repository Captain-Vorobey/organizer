Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  get '/about', to: 'home#about'

  get '/basket', to: 'basket#show'

  get '/companies/:id', to: 'company#index'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/services/:id/orders/new', to: 'orders#new'

  post '/services/:service_id/orders/new', to: 'orders#create', as: :service_order

  get '/services/:id/time_limits/new', to: 'time_limits#new'

  post '/services/:service_id/time_limits/new', to: 'time_limits#create'

  resources :start_time
  post 'start_time/validate', to: 'start_time#validate', as: :start_time_validation

  resources :orders
  resources :time_limits

  resources :services do
    resource :order

    collection do
      get :search
    end
  end

  resources :companies

  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
