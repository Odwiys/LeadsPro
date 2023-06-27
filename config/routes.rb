Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[new create index]

  resources :campaigns do
    resources :forms, only: %i[new create edit] do
      resources :questions, only: %i[new create]
    end
    resources :leads
  end

  resources :forms, only: [] do
    resources :questions, only: %i[] do
      resources :form_questions, only: [:create]
    end
  end

  resources :questions, only: [] do
    resources :options, only: %i[:create]
    # resources :options, only: %i[new create]
  end

  resources :forms, only: :update
  
  get "dashboard", to: "pages#dashboard"
  post "sendemail", to: "send_email#send_email"
end
