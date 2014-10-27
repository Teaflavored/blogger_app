Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: :create
  end
  resources :tags
end
