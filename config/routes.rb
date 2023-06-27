Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[new create index]

  resources :campaigns do
    resources :forms, only: %i[new create edit] do
      resources :questions, only: %i[new create] do
        resources :options, only: %i[new create]
      end
    end
    resources :leads
  end

  resources :forms, only: :update

  get "dashboard", to: "pages#dashboard"
end
