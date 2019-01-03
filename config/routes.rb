Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #  resources :tests
  #  resource :question, controller: :question
  #  resource :categories, only: %i[index, show]
  root to: 'tests#index'
  resources :tests do
    resources :questions
  end
end
