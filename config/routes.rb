Rails.application.routes.draw do
  root to: "snips#new"
  resources :snips, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :show]
  end
end
