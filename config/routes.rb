Rails.application.routes.draw do
  resources :external_requests, only: :index
  resources :transfers, only: :create
end
