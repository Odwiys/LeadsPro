Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[new create index]
  resources :leads

  resources :campaigns do
    resources :forms, only: %i[new create edit]
  end

  get "dashboard", to: "pages#dashboard"
end
