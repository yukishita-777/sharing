Rails.application.routes.draw do
  get 'rooms/new'
  get 'rooms/create'
  get 'rooms/show'
  get 'rooms/update'
  get 'rooms/destroy'
  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  
  devise_scope :user do
    get 'users/account', to: 'users/registrations#account', as: 'account'
    get 'users/profile', to: 'users/registrations#profile', as: 'profile'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  
  resources :rooms
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
