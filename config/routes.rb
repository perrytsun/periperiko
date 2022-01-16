Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root 'tests#index' # 追記(indexページをトップページにする場合)
end
