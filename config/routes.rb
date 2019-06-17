Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :posts
  
  devise_for :users
  scope "/admin" do
    resources :users
  end
  
  root to: 'welcome#index'
  
  resources :users do
    member do
      get :confirm_email
    end
  end

end
