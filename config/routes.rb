Rails.application.routes.draw do
  root to: 'tests#index'

  get :sign_up, to: 'users#new'
  get :login,   to: 'sessions#new'

  delete :logout, to: 'sessions#destroy'

  resources :tests do
    resources :questions, shallow: true  do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :categories
  resources :users, except: :new
  resources :sessions, only: :create
end
