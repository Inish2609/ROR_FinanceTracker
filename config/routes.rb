Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'recover_password',
    confirmation: 'email_confirmation',
    registration: 'register',
    unlock: 'unlock_account'
  }
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'my_stock',to:'pages#my_stock'
  get 'search_stock',to:'stocks#search'
end
