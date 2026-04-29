Rails.application.routes.draw do
  namespace :admin do
    get "users/index"
    get "dashboard/index"
    resources :users, only: [ :index, :show ]
  end

  namespace :clients do
    get "dashboard", to: "dashboard#index", as: :dashboard
  end

  get "users/onboarding"
  get "dashboard/client"
  devise_for :users
  get "home/index"
  root "home#index"

  devise_scope :user do
    get "admin/login", to: "users/sessions#new_admin", as: :new_admin_session
    post "admin/login", to: "users/sessions#create_admin", as: :admin_session
  end

  get "admin/dashboard", to: "admin/dashboard#index", as: :admin_dashboard



  get "onboarding", to: "users#onboarding"
  patch "onboarding", to: "users#update_onboarding"

  get "profile", to: "users#show", as: :user_profile
end
