Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}

  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"

  get "/members/" => "members#index"
  get "/alumni" => "members#alumni"
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
