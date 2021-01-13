Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  get '/about', to: 'home#about'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/users/:id/companies/new', to: 'companies#new'

  post '/users/:id/companies/new', to: 'companies#create', as: :user_company

  get '/users/:id/services/new', to: 'services#new'

  post '/users/:id/services/new', to: 'services#create', as: :user_services

  get '/services/:id/orders/new', to: 'orders#new'

  post '/services/:service_id/orders/new', to: 'orders#create', as: :service_order

  get '/services/:id/time_limits/new', to: 'time_limits#new'

  post '/services/:service_id/time_limits/new', to: 'time_limits#create'

  resources :start_time
  post 'start_time/validate', to: 'start_time#validate', as: :start_time_validation

  resources :users
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
