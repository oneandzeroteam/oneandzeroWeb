Rails.application.routes.draw do
  resources :posts
  resources :posts do
    resources :comments
  end
  
  devise_for :users, controllers: {registrations: "registrations"}

  root "pages#show", page: "index"
  get "/pages/:page" => "pages#show"

  get "/board/:boardname" => "posts#index"
  get "/board/:boardname/posts/new" => "posts#new"
  post "/board/:boardname/posts/" => "posts#create"
  get "/board/:boardname/posts/:post_id" => "posts#show"

  #post "/members/new" => "members#new"
  get "/members/" => "members#index"
  get "/alumni" => "members#alumni"
  get "/professor" => "members#professor"
  get "/members/:id" => "members#show"

  # ADMIN
  get "/admin/dashboard" => "admin#dashboard"
  get "/admin/users" => "admin#index_users"
  get "/admin/members/" => "admin#index_members"
  get "/admin/members/new" => "members#new"
  delete "/admin/users/:userid" => "admin#destroy_user"
  delete "/admin/members/:memberid" => "admin#destroy_member"

  end
