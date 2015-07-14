Rails.application.routes.draw do
  root to: "snips#index"
  resources :snips, only: [:new, :index, :create]
end
