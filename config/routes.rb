Rails.application.routes.draw do

  

  get 'session/new'
  get 'session/create'
  resources :services
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
