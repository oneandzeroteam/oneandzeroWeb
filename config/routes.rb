Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}

  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"

  # ADMIN
  get "/admin/dashboard" => "admin#dashboard"
  get "/admin/users" => "admin#indexusers"
  delete "/admin/users/:userid" => "admin#deleteuser"
end
