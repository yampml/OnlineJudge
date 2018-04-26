Rails.application.routes.draw do
  get 'problems/index'

  get 'problems/show'

  get 'problems/new'

  get 'problems/edit'

  get 'problems/create'

  get 'problems/update'

  get 'problems/destroy'

  get 'sessions/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  resources :blogs, only: [:create, :destroy]


  scope '/admin' do
    resources :problems, only: [:new, :edit, :create, :update, :destroy]
  end
  
  

end
