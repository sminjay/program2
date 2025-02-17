Rails.application.routes.draw do

  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root 'movies#index'

  namespace :admin do
    root "movies#index"
    resources :administrators, only: [:show, :edit, :update,:destroy]

    resources :users,:movies, :shows,:tickets
  end

  resources :tickets
  resources :shows
  resources :movies do
    resources :shows, only: [:index,:new,:create] # Nested route to fetch shows for a movie
  end
  resources :shows do
    resources :tickets, only: [:new, :create]  # Nest tickets under shows
  end
  resources :users
  get '/shows/:id/price', to: 'shows#price'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  delete 'logout', to: 'sessions#destroy'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  end
