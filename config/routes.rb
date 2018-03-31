Rails.application.routes.draw do
  root 'developers#index'

  # get 'developers#index'
  # get 'programming_languages#index'
  # get 'interviews#index'

  resource :developers
  resource :programming_languages
  resource :interviews

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
