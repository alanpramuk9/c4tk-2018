Rails.application.routes.draw do
  root "pages#home"

  resources :accounts, only: [:create]
  resources :cards, except: [:index, :new]
  resources :characters, only: [:index]
  resources :sessions, only: [:create]
  resources :topics, only: [:index]

  get "/cards/new/:type" => "cards#new", as: :new_card
  get "/cards/:card_id/tags/:type" => "card_tags#index", as: :list_card_tags
  post "/cards/:card_id/tags/:type" => "card_tags#create", as: :add_card_tag
  delete "/cards/:card_id/tags/:type" => "card_tags#destroy", as: :remove_card_tag

  get "/sign-up" => "accounts#new", as: :sign_up
  get "/me" => "accounts#profile", as: :profile
  get "/me/delete" => "accounts#confirm_destroy", as: :please_delete_me
  post "/me/delete" => "accounts#destroy", as: :delete_me_now

  get "/sign-in" => "sessions#new", as: :sign_in
  get "/sign-out" => "sessions#destroy", as: :sign_out

  get "/pages/:page" => "pages#show"

  get "/search" => "search#index", as: :search

  constraints format: /\.html/ do
    get "*not_found.:format" => "pages#not_found"
  end
end
