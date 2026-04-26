Rails.application.routes.draw do
  get "dashboard/client"
  devise_for :users
  get "home/index"
  root "home#index"

  get "dashboard/client", to: "dashboard#client", as: :client_dashboard
end
