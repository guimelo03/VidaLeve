Rails.application.routes.draw do
  namespace :admin do
    get "users/index"
    get "dashboard/index"
    resources :users, only: [ :index, :show ] do
      member do
        patch :assign_professional
      end

      resources :diets, only: [ :new, :create, :show, :edit, :update, :destroy ]
    end
  end

  namespace :clients do
    get "dashboard", to: "dashboard#index", as: :dashboard
    resources :diets, only: [ :show ]
    resource :profile, only: [ :show, :edit, :update ]
    resource :onboarding, only: [ :show, :update ]
  end

  namespace :professionals do
    get "dashboard", to: "dashboard#index", as: :dashboard

    resources :clients, only: [ :index, :show ] do
      resources :diets
    end

    resource :profile, only: [ :show, :edit, :update ]
  end

  get "users/onboarding"
  get "dashboard/client"

  devise_for :users,
    controllers: {
      sessions: "users/sessions"
    }

  get "home/index"
  root "home#index"

  get "login", to: "sessions#select"

  devise_scope :user do
    get "admin/login", to: "users/sessions#new_admin", as: :new_admin_session
    post "admin/login", to: "users/sessions#create_admin", as: :admin_session

    get  "professional/login",
      to: "users/sessions#new_professional",
      as: :new_professional_session

    post "professional/login",
      to: "users/sessions#create_professional",
      as: :professional_session

    get "professional/signup",
      to: "users/registrations#new_professional",
      as: :new_professional_registration

    post "professional/signup",
      to: "users/registrations#create_professional",
      as: :professional_registration
  end

  get "admin/dashboard", to: "admin/dashboard#index", as: :admin_dashboard
end
