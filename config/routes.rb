Rails.application.routes.draw do
<<<<<<< HEAD

  resources :timeline
=======
 
  resources :projects
  resources :posts
>>>>>>> e874be0fc7f2551fc0a296b3922fd393b2ed88fa
  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: {registrations: "registrations"}

  root "pages#show", pagename: "index"
  get "/pages/:pagename" => "pages#show"
  post "/pages/recruit_check" => "pages#recruit_check"

  #timeline routes
  # get '/timeline/index' => "timeline#index"
  # post '/timeline/index' => "timeline#create"
  # get '/timeline/new' => "timeline#new"
  # get '/timeline/edit'
  # get '/timeline/destroy'

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
