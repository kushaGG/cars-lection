Rails.application.routes.draw do
  get 'profiles/new'

  get 'profiles/show'

  get 'profiles/edit'

  resources :posts
  resources :profiles
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
