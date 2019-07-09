Rails.application.routes.draw do
  resources :categories
  resources :registers
  resources :events
  post 'create_user' => 'users#new' ,as: :create_user
  namespace :admin do
    resources :users
    resources :posts
    root to: 'users#index'
  end

  get 'users/show'
  mount RailsAdmin::Engine => '/sadmin', as: 'rails_admin'
  resources :posts
  devise_for :users, :path_prefix => 'my'
  resources :users
  root to: 'welcome#index'

  resources :users do
    member do
      get :confirm_email
    end
  end

  match '/guest', to: 'registers#new', via: 'get'
  match '/show', to: 'users#show' , via: 'get'
  match 'dashboard', to: 'rails_admin/main#dashboard', via: 'get'
  match '/index', to: 'welcome#index', via: 'get'
  match '/eventshow', to: 'events#events', via: 'get'
  match '/news', to: 'posts#news', via: 'get'
  match '/usershow', to: 'users#users', via: 'get'





end
