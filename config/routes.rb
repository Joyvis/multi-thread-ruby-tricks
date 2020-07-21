Rails.application.routes.draw do
  resources :external_requests, only: :index
  resources :bank_accounts, only: :show
end
