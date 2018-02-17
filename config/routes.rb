Rails.application.routes.draw do
  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/users/navbar', to: 'users#navbar'

  resources :users do
    member do
      get :following, :followers, :favorites
    end
  end

  resources :microposts, only: %i[create destroy], constraints: { id: /\d+/ } do
    resource :favorites, only: %i[create destroy], controller: 'microposts/favorites'
  end

  resources :relationships, only: %i[create destroy]

 end
