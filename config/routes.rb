Rails.application.routes.draw do
  resources :customers, only: [:show, :create, :new]
  resources :transactions, only: [:create, :new]
end