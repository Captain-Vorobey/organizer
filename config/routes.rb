Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  get '/about', to: 'home#about'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/companies/new', to: 'companies#new'

  post '/companies/new', to: 'companies#create', as: :user_company

  get '/services/new', to: 'services#new'

  post '/services/new', to: 'services#create', as: :user_services

  get '/services/:id/edit', to: 'services#edit', as: :edit_admin_service_path

  get '/services/:id/orders/new', to: 'orders#new'

  post '/orders/new', to: 'orders#create', as: :service_order

  get '/time_limits/new', to: 'time_limits#new'

  post '/time_limits/new', to: 'time_limits#create'

  resources :start_time
  
  post 'start_time/validate', to: 'start_time#validate', as: :start_time_validation

  resources :users do
    resources :services, shallow: true
    resources :companies, shallow: true
  end

  resources :services do
    resources :orders, shallow: true
    resources :comments
  end

  resources :orders
  resources :time_limits

  resources :services do
    resource :orders, shallow: true
    resources :time_limits

    collection do
      get :search
    end
  end

  resources :companies

  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
