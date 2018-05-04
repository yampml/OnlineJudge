# == Route Map
#
#                 Prefix Verb   URI Pattern                                     Controller#Action
#           sessions_new GET    /sessions/new(.:format)                         sessions#new
#                   root GET    /                                               static_pages#home
#                   help GET    /help(.:format)                                 static_pages#help
#                  about GET    /about(.:format)                                static_pages#about
#                contact GET    /contact(.:format)                              static_pages#contact
#                 signup GET    /signup(.:format)                               users#new
#                        POST   /signup(.:format)                               users#create
#                  login GET    /login(.:format)                                sessions#new
#                        POST   /login(.:format)                                sessions#create
#                 logout DELETE /logout(.:format)                               sessions#destroy
#                  users GET    /users(.:format)                                users#index
#                        POST   /users(.:format)                                users#create
#               new_user GET    /users/new(.:format)                            users#new
#              edit_user GET    /users/:id/edit(.:format)                       users#edit
#                   user GET    /users/:id(.:format)                            users#show
#                        PATCH  /users/:id(.:format)                            users#update
#                        PUT    /users/:id(.:format)                            users#update
#                        DELETE /users/:id(.:format)                            users#destroy
#                  blogs POST   /blogs(.:format)                                blogs#create
#                   blog DELETE /blogs/:id(.:format)                            blogs#destroy
#            submissions POST   /submissions(.:format)                          submissions#create
#         new_submission GET    /submissions/new(.:format)                      submissions#new
#    problem_submissions POST   /problems/:problem_id/submissions(.:format)     submissions#create
# new_problem_submission GET    /problems/:problem_id/submissions/new(.:format) submissions#new
#               problems GET    /problems(.:format)                             problems#index
#                        POST   /problems(.:format)                             problems#create
#            new_problem GET    /problems/new(.:format)                         problems#new
#           edit_problem GET    /problems/:id/edit(.:format)                    problems#edit
#                problem GET    /problems/:id(.:format)                         problems#show
#                        PATCH  /problems/:id(.:format)                         problems#update
#                        PUT    /problems/:id(.:format)                         problems#update
#                        DELETE /problems/:id(.:format)                         problems#destroy
#                        POST   /admin/problems(.:format)                       problems#create
#                        GET    /admin/problems/new(.:format)                   problems#new
#                        GET    /admin/problems/:id/edit(.:format)              problems#edit
#                        PATCH  /admin/problems/:id(.:format)                   problems#update
#                        PUT    /admin/problems/:id(.:format)                   problems#update
#                        DELETE /admin/problems/:id(.:format)                   problems#destroy

Rails.application.routes.draw do
  # get 'problems/index', to: 'problems#index', as: 'problemset'

  # get 'problems/:id', to: 'problems#show', as: 'problem' 

  # get 'problems/new'

  # get 'problems/edit'

  # get 'problems/create'

  # get 'problems/update'



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

  resources :contests, only: [:index, :show]

  resources :submissions, only: [:new, :create]
  
  get 'problemset', to: 'problems#index', as: 'problemset'

  get 'problems/:id', to: 'problems#show', as: 'problem' 
  
  scope '/admin' do
    resources :problems, only: [:new, :edit, :create, :update, :destroy]
    resources :contests, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :submissions, only: [:show]

  resources :problems do
    resources :submissions, only: [:new, :create] 
  end

  resources :submissions, only: [:new, :create, :index]

  resources :contests do
    resources :problems, only: [:show] do
      resources :submissions, only: [:new, :create]
    end
  end

  get '/contests/:id/scoreboard', to: 'contests#scoreboard', as: 'contest_scoreboard'

end
