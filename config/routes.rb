Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'

  get 'users/profile', as: 'user_root' # It will be deleted, but now needed because isn't working another route

  get '/about', to: 'home#about'

  get '/companies/:id', to: 'company#index'

  get '/users/:id', to: 'user#profile' # I must refactor it else

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
