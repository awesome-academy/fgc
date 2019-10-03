Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    resources :users, only: [:new, :create]
  end
end
