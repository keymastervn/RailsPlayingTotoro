Rails.application.routes.draw do
  root 'developers#index'

  # get 'developers#index'
  # get 'programming_languages#index'
  # get 'interviews#index'

  resources :developers
  resources :programming_languages
  resources :interviews

  namespace :api do
    resources :developers, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
