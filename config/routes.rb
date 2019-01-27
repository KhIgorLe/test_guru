Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: { sessions: :sessions },
             path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    resources :questions, only: :index, shallow: true

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    root to: 'tests#index'

    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :categories
    resources :gists, only: :index
  end
end
