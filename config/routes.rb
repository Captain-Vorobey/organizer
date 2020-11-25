Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'

  get '/about', to: 'home#about'

  get '/companies/:id', to: 'company#index'

  get '/users/:id', to: 'users#show', as: 'user'

  devise_for :users

  resources :services do
    collection do
      get :search
    end
  end

  resources :companies
  resources :users

  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
