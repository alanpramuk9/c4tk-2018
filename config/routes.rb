Rails.application.routes.draw do
  root "pages#home"

  resources :accounts, only: [:create]
  resources :annotations, except: [:index, :new]
  resources :characters, only: [:index]
  resources :sessions, only: [:create]
  resources :theological_themes, only: [:index]
  resources :topics, only: [:index]

  get "/annotations/new/:type" => "annotations#new", as: :new_annotation

  get "/sign-up" => "accounts#new", as: :sign_up
  get "/me" => "accounts#profile", as: :profile
  get "/me/delete" => "accounts#confirm_destroy", as: :please_delete_me
  post "/me/delete" => "accounts#destroy", as: :delete_me_now

  get "/sign-in" => "sessions#new", as: :sign_in
  get "/sign-out" => "sessions#destroy", as: :sign_out

  get "/pages/:page" => "pages#show"

  get "*not_found" => "pages#not_found"
end
