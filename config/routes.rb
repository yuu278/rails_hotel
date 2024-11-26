Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "home#index"

  resources :users, only: [:index, :show, :edit, :update]
  resource :profile, only: [:edit, :update]
  resources :rooms do
    collection do
      get 'search'
    end
    resources :reservations, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end