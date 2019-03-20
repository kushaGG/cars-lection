Rails.application.routes.draw do
  resources :posts
  resources :profiles
  resources :photos
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'pages#index'

  get '/profile_info/:id', to: "profiles#profile_info", as: "profile_info"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
