Rails.application.routes.draw do

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'

  get 'signup'  => 'users#new'

  resources :users do
    resources :companies
  end

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  post 'companies/:company_id/approve' => 'companies#approve', as: 'companies_approve'
  post 'companies/:company_id/disapprove' => 'companies#disapprove', as: 'companies_disapprove'
  post 'companies/:company_id/destroy' => 'companies#destroy', as: 'companies_destroy'

  get  'admin/dashboard' => 'admin#dashboard', as:'admin_dashboard'
  get 'admin/companies'  => 'admin#companies', as:'admin_companies'
  get 'admin/users'  => 'admin#users', as:'admin_users'

  post 'like/:id', to: 'posts#like', as: :like
  resources :posts

end
