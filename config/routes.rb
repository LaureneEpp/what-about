Rails.application.routes.draw do
  get "users/account"
  namespace :admin do
    resources :users
    resources :posts
    resources :roles
    resources :comments
    resources :categories
    resources :rooms

    root to: "posts#index"
  end
  get "search", to: "search#index"

  #available for anyone – in our example app it can
  root "static_pages#landing_page"
  # available only for logged in users – user has to sign in to see this area of the app
  get "static_pages/dashboard"
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
             }
  resources :categories, only: %i[index]
  resources :follows
  resources :posts do
    resources :comments
  end
  resources :rooms do
    resources :messages
  end
  get "/users", to: "users#index", as: "users"
  get "users/:id", to: "users#show", as: "user"
  post "/users/:id/follow", to: "users#follow", as: "follow_user"
  get "/users/:id/follow", to: "follows#index", as: "followers"
  post "/users/:id/unfollow", to: "users#unfollow", as: "unfollow_user"
  get "account/:id", to: "users#account", as: :account
  get "profile/:id", to: "users#profile", as: :profile
end
