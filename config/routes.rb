Rails.application.routes.draw do
  get "search", to: "search#index"
  get "users/index"
  get "users/show"
  # root 'posts#index'
  root "static_pages#landing_page"
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
             }
  scope "/admin" do
    resources :users, only: %i[show index]
    # resources :users
  end

  # get "static_pages/landing_page"
  get "static_pages/dashboard"

  resources :posts do
    resources :comments
  end
end
