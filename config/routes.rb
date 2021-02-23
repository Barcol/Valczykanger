Rails.application.routes.draw do
  devise_for :users,
             only: [:omniauth_callbacks],
             controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, skip: :omniauth_callbacks
  end

  devise_scope :user do
    authenticated :user do
      root to: "welcome#show", as: :authenticated_root
    end

    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
      get "/:locale", locale: /#{I18n.available_locales.join("|")}/, to: "devise/sessions#new"
    end
  end
end
