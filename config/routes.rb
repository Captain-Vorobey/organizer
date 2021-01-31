Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'home#index'
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  { class_name: 'User' }.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  get '/about', to: 'home#about'

  get '/services/:id/orders/new', to: 'orders#new'

  get '/services/search', to: 'services#search', as: :search

  post '/orders/new', to: 'orders#create', as: :service_order

  resources :start_time

  resources :users do
    resources :services, shallow: true
    resources :companies
  end

  resources :companies do
    resources :comments
  end

  resources :orders

  resources :services do
    resources :orders, shallow: true
    resources :time_limits, shallow: true
    resources :comments

    collection do
      get :search
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
