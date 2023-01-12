Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants, only: %i[index create new show] do
    # the new and create methods don't use :id or any unique paths, and so should be nested
    resources :reviews, only: %i[new create]
  end
  # the destroy method uses :id, so doesn't need to be nested
  resources :reviews, only: [:destroy]
end
