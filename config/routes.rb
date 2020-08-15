Rails.application.routes.draw do
  resources :images
  resources :videos
  resources :audios
  get "users/dashboard"
  get "password_resets/new"
  get "password_resets/edit"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  root "home#index"
  resources :users do
    member do
      get :subscriptions, :subscribers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
