Rails.application.routes.draw do

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'

  get 'signup'  => 'users#new'

  resources :users do
    resources :companies
  end

  get 'companies' => 'companies#index'
  get 'companies/:id' => 'companies#show_specific'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  post 'companies/:company_id/approve' => 'companies#approve', as: 'companies_approve'
  post 'companies/:company_id/disapprove' => 'companies#disapprove', as: 'companies_disapprove'
  post 'companies/:company_id/destroy' => 'companies#destroy', as: 'companies_destroy'

  get  'admin/dashboard' => 'admin#dashboard', as:'admin_dashboard'
  get 'admin/companies'  => 'admin#companies', as:'admin_companies'
  get 'admin/users'  => 'admin#users', as:'admin_users'
  get 'admin/categories'  => 'admin#categories', as:'admin_categories'

  post 'like/:id', to: 'posts#like', as: :like
  post 'share/:id', to: 'posts#share', as: :share
  post 'comment/:id', to: 'posts#comment', as: :comment
  delete 'comment/:id' => 'posts#comment_destroy'
  put 'comment/:id' => 'posts#comment_update'

  resources :posts
  resources :categories

  #api routes - mobile
  get 'api/posts', to: 'api#posts'
  post 'api/posts', to: 'api#create'
  post 'api/posts/:id/like', to: 'api#like'
  post 'api/posts/:id/share', to: 'api#share'
  get 'api/image/:post_id', to: 'api#image'

end
