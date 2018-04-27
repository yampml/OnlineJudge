Gem annotate will automatically add some fuking comment to routes, db file, blah blah

== How to use
In terminal type: annotate. Zis will add some comment like this:

# == Schema Information
#
# Table name: problems
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  timelimit  :float
#  memlimit   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  file_name  :json
#
class Problem < ApplicationRecord
	has_many :submissions
. . .

But in the routes file, Zis will be: annotate --routes. Like Zis, like Zuy: 

# == Route Map
#
#           Prefix Verb   URI Pattern                        Controller#Action
#       problemset GET    /problems/index(.:format)          problems#index
#    problems_show GET    /problems/show(.:format)           problems#show
#     problems_new GET    /problems/new(.:format)            problems#new
#    problems_edit GET    /problems/edit(.:format)           problems#edit
#  problems_create GET    /problems/create(.:format)         problems#create
#  problems_update GET    /problems/update(.:format)         problems#update
# problems_destroy GET    /problems/destroy(.:format)        problems#destroy
#     sessions_new GET    /sessions/new(.:format)            sessions#new
#             root GET    /                                  static_pages#home
#             help GET    /help(.:format)                    static_pages#help
#            about GET    /about(.:format)                   static_pages#about
#          contact GET    /contact(.:format)                 static_pages#contact
#           signup GET    /signup(.:format)                  users#new
#                  POST   /signup(.:format)                  users#create
#            login GET    /login(.:format)                   sessions#new
#                  POST   /login(.:format)                   sessions#create
#           logout DELETE /logout(.:format)                  sessions#destroy
#            users GET    /users(.:format)                   users#index
#                  POST   /users(.:format)                   users#create
#         new_user GET    /users/new(.:format)               users#new
#        edit_user GET    /users/:id/edit(.:format)          users#edit
#             user GET    /users/:id(.:format)               users#show
#                  PATCH  /users/:id(.:format)               users#update
#                  PUT    /users/:id(.:format)               users#update
#                  DELETE /users/:id(.:format)               users#destroy
#            blogs POST   /blogs(.:format)                   blogs#create
#             blog DELETE /blogs/:id(.:format)               blogs#destroy
#         problems POST   /admin/problems(.:format)          problems#create
#      new_problem GET    /admin/problems/new(.:format)      problems#new
#     edit_problem GET    /admin/problems/:id/edit(.:format) problems#edit
#          problem PATCH  /admin/problems/:id(.:format)      problems#update
#                  PUT    /admin/problems/:id(.:format)      problems#update
#                  DELETE /admin/problems/:id(.:format)      problems#destroy
#      submissions POST   /submissions(.:format)             submissions#create
#   new_submission GET    /submissions/new(.:format)         submissions#new
. . .
== How to unZues
If you wanna to get a bit cleaner Git, remove them all before commit, zue zis:

    annotate --delete
    annotate --routes --delete

Zone zoy, go go zuy