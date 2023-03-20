Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get "search", to: "search#index"
  # get "users/index"
  # get "users/show"

  #available for anyone – in our example app it can
  root "static_pages#landing_page"
  # available only for logged in users – user has to sign in to see this area of the app
  get "static_pages/dashboard"
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
             }
  scope "/admin" do
    resources :users, only: %i[show index]
    # resources :users
  end
  resources :posts do
    resources :comments
  end
end
