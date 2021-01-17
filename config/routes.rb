Rails.application.routes.draw do
  root 'rooms#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  
  devise_scope :user do
    get 'users/account', to: 'users/registrations#account', as: 'account'
    get 'users/profile', to: 'users/registrations#profile', as: 'profile'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  
  resources :rooms do
    collection do
      get 'posts'
      get 'search'
    end
    resources :reservations, only:[:new, :create, :show]
  end
  
  get 'reservations', to: 'reservations#index'
  
  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
