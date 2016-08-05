Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  resource :github_webhooks, only: :create, defaults: { formats: :json }
  
  devise_for :users, controllers: {registrations: "registrations"}

  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"


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
