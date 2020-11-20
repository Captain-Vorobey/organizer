Rails.application.routes.draw do

  get 'company/index'
  get 'home/index'

  root to: 'home#index'

  get 'users/profile', as: 'user_root'
  get '/about', to: 'users#about'
  get '/company', to: 'company#index'

  devise_for :users

  resources :services do 
    collection do
      get :search
    end
  end

  resources :companies

  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
