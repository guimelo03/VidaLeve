Rails.application.routes.draw do
  get "users/onboarding"
  get "dashboard/client"
  devise_for :users
  get "home/index"
  root "home#index"

  get "dashboard/client", to: "dashboard#client", as: :client_dashboard

  get "onboarding", to: "users#onboarding"
  patch "onboarding", to: "users#update_onboarding"
end
