Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[new create index]

  resources :campaigns do
    resources :forms, only: %i[new create edit show] do
      resources :questions, only: %i[new create]
    end

    resources :leads, except: %i[new create]
  end

  resources :leads, only: [] do
    resources :response, only: %i[new create]
  end

  resources :forms do
   resources :leads
  end

  resources :responses, only: %i[create] do
    resources :answers, only: %i[new create] do
      collection do
        post 'attempt'
      end
    end
  end

  resources :responses, only: %i[edit update]

  resources :questions, only: [] do
    resources :options, only: %i[:create]
    # resources :options, only: %i[new create]
  end

  resources :forms, only: :update

  get "dashboard", to: "pages#dashboard"
end
