Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "welcome#show"
  end

  root to: redirect("/users/sign_in", status: 302), as: :unauthenticated_root
  get "/booom", to: "welcome#new"
end
