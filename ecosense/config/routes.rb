Rails.application.routes.draw do

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'

  get 'signup'  => 'users#new'

  resources :users

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'signup/company' => 'companies#new'
  get 'login/company' => 'companies#login_show'
  post 'login/company' => 'companies#login'
  get 'logout/company' => 'companies#logout'

  resources :companies
end
