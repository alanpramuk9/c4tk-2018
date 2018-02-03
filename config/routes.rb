Rails.application.routes.draw do
  root "pages#home"

  get "/pages/:page" => "pages#show"

  get "*not_found" => "pages#not_found"
end
