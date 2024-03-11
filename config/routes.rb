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
  get 'my_friends',to:'pages#my_friends'
  delete 'my_friends',to:"pages#delete_friends"
  get 'search_friends',to:'pages#search_friends'
  post 'add_friend/:id',to:'pages#add_friend',as:"add_friend"
  get 'users/:id',to:"pages#show",as:"user"
end
