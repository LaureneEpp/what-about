Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  # root 'posts#index'
  root "static_pages#landing_page"
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
             }
  resources :users, only: %i[show index]
  # devise_for :users
  get "static_pages/landing_page"
  get "static_pages/dashboard"

  resources :posts do
    resources :comments
  end
end
