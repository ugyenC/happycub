Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :posts

      root to: "users#index"
    end

  get 'users/show'
  
  #admin
  #devise_for :admin, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  mount RailsAdmin::Engine => '/sadmin', as: 'rails_admin'
  resources :posts
  

  devise_for :users
  resources :users
  

  get 'devise/profile'
  
  root to: 'welcome#index'
  
  resources :users do
    member do
      get :confirm_email
    end
  end


  match '/show', to: 'users#show' , via: 'get'
  match 'dashboard', to: 'rails_admin/main#dashboard', via: 'get'


end
