Rails.application.routes.draw do
 
  resources :projects
  resources :posts
  resources :posts do
    resources :comments
  end
  
  devise_for :users, controllers: {registrations: "registrations"}

  root "pages#show", pagename: "index"
  get "/pages/:pagename" => "pages#show"

  #timeline routes
  get '/timeline/index'
  get '/timeline/timeline_create'
  get '/timeline/timeline_update'
  get '/timeline/timeline_destroy'

  get "/board/tech-blog" => "posts#blog"
  get "/board/:boardname" => "posts#index"
  get "/board/:boardname/posts/new" => "posts#new"
  post "/board/:boardname/posts/" => "posts#create"
  get "/board/:boardname/posts/:post_id" => "posts#show"
  

  get "/members/" => "members#index"
  get "/alumni" => "members#alumni"
  get "/chairman_greeting" => "members#chairman_greeting"
  get "/professor" => "members#professor" 
  
  get "/members/:id" => "members#show"

  # ADMIN
  get "/admin/dashboard" => "admin#dashboard"
  get "/admin/users" => "admin#index_users"
  get "/admin/members/" => "admin#index_members"
  get "/admin/members/new" => "admin#new_member"
  post "/admin/members" => "admin#create_member"
  delete "/admin/users/:userid" => "admin#destroy_user"
  delete "/admin/members/:memberid" => "admin#destroy_member"

  end
