Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #  resources :tests
  #  resource :question, controller: :question
  #  resource :categories, only: %i[index, show]
  root to: 'tests#index'
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

  resources :categories, :users
end
