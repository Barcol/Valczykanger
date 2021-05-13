Rails.application.routes.draw do
  devise_for :users,
             only: :omniauth_callbacks,
             controllers: { omniauth_callbacks: "users/omniauth_callbacks"}

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users,
               skip: :omniauth_callbacks,
               controllers: {registrations: "users/registrations"}
  end

  devise_scope :user do
    match "/users/auth/facebook/delete",
          to: "users/omniauth_callbacks#facebook_user_deletion",
          as: "user_facebook_omniauth_deletion_callback",
          via: [:get, :post]

    authenticated :user do
      root to: "dashboard#show", as: :authenticated_root
    end

    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
      get "/:locale", locale: /#{I18n.available_locales.join("|")}/, to: "devise/sessions#new"
    end
  end
end
