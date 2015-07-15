Rails.application.routes.draw do
  root to: "snips#new"
  resources :snips, only: [:new, :index, :create, :show]
  resources :comments, only: [:new]
end
