Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: { sessions: :sessions }, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
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

  namespace :admin do
    resources :tests
  end
end
