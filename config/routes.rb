Lsx::Application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update]

  root 'pages#index'
end
