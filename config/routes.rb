Rails.application.routes.draw do
  root "pages#show", pagename: "index"
  get "/pages/:pagename" => "pages#show"

  resources :timeline
  resources :projects
  resources :borrowablestuffs
  get "/borrowablestuffs/:borrowablestuff_id/borrow" => "borrowablestuffs#borrow"
  get "/borrowablestuffs/:borrowablestuff_id/return" => "borrowablestuffs#return"

  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: {registrations: "registrations"}

  post "/pages/recruit_check" => "pages#recruit_check"

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
  get "/admin/borrowed" => "index_borrowed"
  get "/admin/users" => "admin#index_users"
  get "/admin/members/" => "admin#index_members"
  get "/admin/members/new" => "admin#new_member"
  get "/admin/timelines" => "admin#index_timelines"
  get "/admin/timelines/new" => "admin#new_timeline"
  post "admin/timelines" => "admin#create_timeline"
  post "/admin/members" => "admin#create_member"
  delete "/admin/users/:userid" => "admin#destroy_user"
  delete "/admin/members/:memberid" => "admin#destroy_member"

  end
