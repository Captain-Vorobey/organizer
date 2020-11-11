Rails.application.routes.draw do
  get 'home/index'

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  get '/auth/:provider/callback', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
